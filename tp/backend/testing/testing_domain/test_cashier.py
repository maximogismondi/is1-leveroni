import unittest
from backend.implementation.domain.cashier import Cashier
from backend.implementation.domain.cart import Cart
from backend.implementation.domain.credit_card import CreditCard
from backend.implementation.domain.month_of_year import MonthOfYear
from datetime import datetime


class CashierTesting(unittest.TestCase):
    """setup"""

    def setUp(self):
        self.one_client = "usuario1"
        self.another_client = "usuario2"

        self.one_book = "12345"
        self.one_book_price = 10

        self.another_book = "54321"
        self.another_book_price = 20

        self.catalog = {
            self.one_book: self.one_book_price,
            self.another_book: self.another_book_price,
        }
        self.one_cart = Cart.with_catalog(self.catalog)
        self.another_cart = Cart.with_catalog(self.catalog)

        self.cashier = Cashier.with_clock_and_payment_processor(self, self)

        self.valid_card_number = 1234567890123456
        self.valid_card_expiration_date = MonthOfYear(6, 2024)
        self.valid_card_name = "nombre"

        self.valid_card = CreditCard.with_number_expiration_date_and_name(
            self.valid_card_number,
            self.valid_card_expiration_date,
            self.valid_card_name,
        )

        self.stolen_card_number = 1111111111111111

    """mocks"""

    def now(self):
        return datetime(2024, 6, 1, 0, 0, 0, 0)

    def debit(self, _amount_to_debit, credit_card):
        if credit_card.number() == self.stolen_card_number:
            raise RuntimeError("Stolen card")

    """assertions"""

    def assert_book_quantity_after_checkout(
        self,
        book_added,
        book_quantity_added,
        book_to_verify_in_resume,
        book_quantity_expected_in_resume,
    ):
        self.one_cart.add_amount_of_books(book_added, book_quantity_added)
        self.cashier.checkout(self.one_cart, self.one_client, self.valid_card)
        client_resume = self.cashier.list_sales(self.one_client)

        self.assertEqual(
            book_quantity_expected_in_resume,
            client_resume.book_quantity(book_to_verify_in_resume),
        )

    def assert_client_resume_book_quantity_and_total_amount(
        self,
        client,
        expected_client_resume_book_quantities,
        expected_client_resume_total_amount,
    ):
        client_resume = self.cashier.list_sales(client)
        client_resume_book_quantities = client_resume.book_quantity(self.one_book)
        client_resume_total_amount = client_resume.total_amount()

        self.assertEqual(
            expected_client_resume_book_quantities, client_resume_book_quantities
        )
        self.assertEqual(
            expected_client_resume_total_amount, client_resume_total_amount
        )

    def assert_client_resume_varieties_of_books_and_total_amount(
        self,
        client,
        expected_client_resume_book_varieties,
        expected_client_resume_total_amount,
    ):

        client_resume = self.cashier.list_sales(client)
        client_resume_books_quantities = client_resume.list_books()
        client_resume_total_amount = client_resume.total_amount()

        self.assertEqual(
            expected_client_resume_book_varieties, len(client_resume_books_quantities)
        )
        self.assertEqual(
            expected_client_resume_total_amount, client_resume_total_amount
        )

    """testing"""

    def test01_checkout_with_empty_cart_fails(self):
        catalog = []
        empty_cart = Cart.with_catalog(catalog)

        self.assertRaises(
            ValueError,
            self.cashier.checkout,
            empty_cart,
            self.one_client,
            self.valid_card,
        )

    def test02_valid_checkout_add_sale_to_sales_book(self):
        self.one_cart.add_book(self.one_book)

        self.cashier.checkout(self.one_cart, self.one_client, self.valid_card)
        client_resume = self.cashier.list_sales(self.one_client)
        client_resume_total_amount = client_resume.total_amount()

        self.assertTrue(client_resume_total_amount > 0)

    def test03_checkout_generate_a_client_resume_which_contains_the_sold_book(self):
        self.assert_book_quantity_after_checkout(self.one_book, 1, self.one_book, 1)

    def test04_client_resume_only_contains_sold_book(self):
        self.assert_book_quantity_after_checkout(self.one_book, 1, self.another_book, 0)

    def test05_checkout_generate_client_resume_with_quantity_sold(self):
        self.assert_book_quantity_after_checkout(self.one_book, 2, self.one_book, 2)

    def test06_client_resume_list_is_empty_without_previous_checkout(self):
        self.assert_client_resume_book_quantity_and_total_amount(self.one_client, 0, 0)

    def test07_can_not_checkout_with_stolen_card(self):
        self.one_cart.add_book(self.one_book)

        stolen_card = CreditCard.with_number_expiration_date_and_name(
            self.stolen_card_number,
            self.valid_card_expiration_date,
            self.valid_card_name,
        )

        self.assertRaises(
            RuntimeError,
            self.cashier.checkout,
            self.one_cart,
            self.one_client,
            stolen_card,
        )

        self.assert_client_resume_book_quantity_and_total_amount(self.one_client, 0, 0)

    def test08_can_not_checkout_with_expired_card(self):
        self.one_cart.add_book(self.one_book)

        date_in_the_past = MonthOfYear(12, 2023)
        expired_card = CreditCard(
            self.valid_card_number, date_in_the_past, self.valid_card_name
        )

        self.assertRaises(
            ValueError,
            self.cashier.checkout,
            self.one_cart,
            self.one_client,
            expired_card,
        )

        self.assert_client_resume_book_quantity_and_total_amount(self.one_client, 0, 0)

    def test09_fails_on_create_invalid_month_of_year(self):
        invalid_month = 13
        valid_year = 2024

        self.assertRaises(
            ValueError, MonthOfYear.with_month_and_year, invalid_month, valid_year
        )

    def test_10_client_resume_accumulate_sales(self):
        self.one_cart.add_book(self.one_book)
        self.another_cart.add_book(self.one_book)

        self.cashier.checkout(self.one_cart, self.one_client, self.valid_card)
        self.cashier.checkout(self.another_cart, self.one_client, self.valid_card)

        expected_total_amount = 2 * self.one_book_price

        self.assert_client_resume_book_quantity_and_total_amount(
            self.one_client, 2, expected_total_amount
        )

    def test_11_client_resume_only_accumulate_own_sales(self):
        self.one_cart.add_book(self.one_book)

        self.cashier.checkout(self.one_cart, self.one_client, self.valid_card)

        self.assert_client_resume_book_quantity_and_total_amount(
            self.another_client, 0, 0
        )

    def test_12_client_resume_acumulate_different_books(self):
        self.one_cart.add_book(self.one_book)
        self.one_cart.add_book(self.another_book)

        self.cashier.checkout(self.one_cart, self.one_client, self.valid_card)

        expected_total_amount = self.one_book_price + self.another_book_price

        self.assert_client_resume_varieties_of_books_and_total_amount(
            self.one_client, 2, expected_total_amount
        )


if __name__ == "__main__":
    unittest.main()
