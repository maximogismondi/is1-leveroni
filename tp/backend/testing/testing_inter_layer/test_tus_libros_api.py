import unittest
from backend.implementation.inter_layer.tus_libros_api import TusLibrosAPI
from backend.implementation.domain.month_of_year import MonthOfYear
from backend.implementation.inter_layer.controlable_clock import ControlableClock
from datetime import datetime, timedelta


class TusLibrosAPITesting(unittest.TestCase):
    """setup"""

    def setUp(self):
        self.isbn = "bookISBN"
        price = 10

        catalog = {self.isbn: price}

        self.client_id = "valid client id"
        self.password = "valid password"

        expiration_time = timedelta(seconds=10)
        self._watch = ControlableClock.with_start_time(datetime(2024, 6, 1, 0, 0, 0))

        self.tus_libros_api = (
            TusLibrosAPI.with_catalog_auth_payment_processor_expiration_time_and_clock(
                catalog,
                self,
                self,
                expiration_time,
                self._watch,
            )
        )
        self.one_quantity = 1
        self.multiple_quantity = 2

        self.valid_card_number = 1234567890123456
        self.valid_card_expiration_date = MonthOfYear(12, 2024)
        self.valid_card_owner = "valid name"

    """error messages"""

    def invalid_credentials_error_message(self):
        return "Invalid credentials"

    """mocks"""

    def authenticate(self, client_id, password):
        if not (client_id == self.client_id and password == self.password):
            raise RuntimeError(self.invalid_credentials_error_message())

    def debit(self, amount_to_debit, credit_card):
        pass

    """testing"""

    def test01_cart_without_books_do_not_list_any_book(self):
        cart_id = self.tus_libros_api.create_cart(self.client_id, self.password)
        books = self.tus_libros_api.list_cart(cart_id)

        self.assertEqual(len(books), 0)

    def test02_cart_with_a_book_list_it(self):
        cart_id = self.tus_libros_api.create_cart(self.client_id, self.password)
        self.tus_libros_api.add_to_cart(cart_id, self.isbn, self.one_quantity)
        books = self.tus_libros_api.list_cart(cart_id)

        self.assertTrue(self.isbn in books)

    def test03_books_added_to_different_carts_are_isolated(self):
        cart_id = self.tus_libros_api.create_cart(self.client_id, self.password)
        another_cart_id = self.tus_libros_api.create_cart(self.client_id, self.password)

        self.tus_libros_api.add_to_cart(cart_id, self.isbn, self.one_quantity)
        books = self.tus_libros_api.list_cart(another_cart_id)

        self.assertFalse(self.isbn in books)

    def test04_cart_with_invalid_id_can_not_add_a_book(self):
        invalid_cart_id = "0"

        self.assertRaises(
            ValueError,
            self.tus_libros_api.add_to_cart,
            invalid_cart_id,
            self.isbn,
            self.one_quantity,
        )

    def test05_cart_with_invalid_id_can_not_list_itself(self):
        invalid_cart_id = "0"

        self.assertRaises(ValueError, self.tus_libros_api.list_cart, invalid_cart_id)

    def test06_cart_list_more_than_one_book_for_each_isbn(self):
        one_cart_id = self.tus_libros_api.create_cart(self.client_id, self.password)

        self.tus_libros_api.add_to_cart(one_cart_id, self.isbn, self.multiple_quantity)
        books = self.tus_libros_api.list_cart(one_cart_id)

        self.assertEqual(self.multiple_quantity, books[self.isbn])

    def test07_cannot_create_cart_with_invalid_credentials(self):
        self.assertRaises(
            RuntimeError,
            self.tus_libros_api.create_cart,
            "Invalid client id",
            "Invalid password",
        )

    def test08_list_purchase_after_checkout(self):
        cart_id = self.tus_libros_api.create_cart(self.client_id, self.password)
        self.tus_libros_api.add_to_cart(cart_id, self.isbn, self.one_quantity)

        self.tus_libros_api.checkout_cart(
            cart_id,
            self.valid_card_number,
            self.valid_card_expiration_date,
            self.valid_card_owner,
        )

        client_resume = self.tus_libros_api.list_purchases(
            self.client_id, self.password
        )
        purchased_books = client_resume.list_books()

        self.assertEqual(self.one_quantity, len(purchased_books))

    def test_09_remove_cart_after_checkout(self):
        cart_id = self.tus_libros_api.create_cart(self.client_id, self.password)
        self.tus_libros_api.add_to_cart(cart_id, self.isbn, self.one_quantity)

        self.tus_libros_api.checkout_cart(
            cart_id,
            self.valid_card_number,
            self.valid_card_expiration_date,
            self.valid_card_owner,
        )

        self.assertRaises(ValueError, self.tus_libros_api.list_cart, cart_id)

    def test10_multiples_transaction_ids_after_checkouts_are_different(self):
        one_cart_id = self.tus_libros_api.create_cart(self.client_id, self.password)
        self.tus_libros_api.add_to_cart(one_cart_id, self.isbn, self.one_quantity)

        another_cart_id = self.tus_libros_api.create_cart(self.client_id, self.password)
        self.tus_libros_api.add_to_cart(another_cart_id, self.isbn, self.one_quantity)

        one_transaction_id = self.tus_libros_api.checkout_cart(
            one_cart_id,
            self.valid_card_number,
            self.valid_card_expiration_date,
            self.valid_card_owner,
        )

        another_transaction_id = self.tus_libros_api.checkout_cart(
            another_cart_id,
            self.valid_card_number,
            self.valid_card_expiration_date,
            self.valid_card_owner,
        )

        self.assertNotEqual(one_transaction_id, another_transaction_id)

    def test11_checkout_with_invalid_id_fails(self):
        invalid_cart_id = "0"

        self.assertRaises(
            ValueError,
            self.tus_libros_api.checkout_cart,
            invalid_cart_id,
            self.valid_card_number,
            self.valid_card_expiration_date,
            self.valid_card_owner,
        )

    def test12_list_cart_fails_after_10_seconds_of_inactivity(self):
        cart_id = self.tus_libros_api.create_cart(self.client_id, self.password)
        self.tus_libros_api.list_cart(cart_id)

        self._watch.add_time(0, 0, 10)

        self.assertRaises(ValueError, self.tus_libros_api.list_cart, cart_id)

    def test13_list_cart_updates_last_access_time_and_prevent_inactivity(self):
        cart_id = self.tus_libros_api.create_cart(self.client_id, self.password)

        self._watch.add_time(0, 0, 5)
        self.assertEqual(len(self.tus_libros_api.list_cart(cart_id)), 0)
        self._watch.add_time(0, 0, 5)

        self.assertEqual(len(self.tus_libros_api.list_cart(cart_id)), 0)

    def test14_add_to_cart_fails_after_10_seconds_of_inactivity(self):
        cart_id = self.tus_libros_api.create_cart(self.client_id, self.password)
        self.tus_libros_api.add_to_cart(cart_id, self.isbn, 1)

        self._watch.add_time(0, 0, 10)

        self.assertRaises(
            ValueError, self.tus_libros_api.add_to_cart, cart_id, self.isbn, 1
        )

    def test15_add_to_cart_updates_last_access_time_and_prevent_inactivity(self):
        cart_id = self.tus_libros_api.create_cart(self.client_id, self.password)

        self._watch.add_time(0, 0, 5)
        self.tus_libros_api.add_to_cart(cart_id, self.isbn, 1)
        self._watch.add_time(0, 0, 5)
        self.tus_libros_api.add_to_cart(cart_id, self.isbn, 1)

        books = self.tus_libros_api.list_cart(cart_id)

        self.assertEqual(2, books[self.isbn])

    def test16_checkout_cart_fails_after_10_seconds_of_inactivity(self):
        cart_id = self.tus_libros_api.create_cart(self.client_id, self.password)
        self.tus_libros_api.add_to_cart(cart_id, self.isbn, 1)
        self.tus_libros_api.list_cart(cart_id)

        self._watch.add_time(0, 0, 10)

        self.assertRaises(
            ValueError,
            self.tus_libros_api.checkout_cart,
            cart_id,
            self.valid_card_number,
            self.valid_card_expiration_date,
            self.valid_card_owner,
        )
        # falta fijarnos que no se haya agregado el carrito

    def test17_cart_expiration_is_isolated_between_carts(self):
        one_cart_id = self.tus_libros_api.create_cart(self.client_id, self.password)
        self._watch.add_time(0, 0, 10)
        other_cart_id = self.tus_libros_api.create_cart(self.client_id, self.password)

        self.assertRaises(ValueError, self.tus_libros_api.list_cart, one_cart_id)
        self.assertEqual(len(self.tus_libros_api.list_cart(other_cart_id)), 0)

    def test18_list_cart_updates_last_access_time_based_on_cart_id(self):
        one_cart_id = self.tus_libros_api.create_cart(self.client_id, self.password)
        self._watch.add_time(0, 0, 5)
        other_cart_id = self.tus_libros_api.create_cart(self.client_id, self.password)

        self.tus_libros_api.list_cart(one_cart_id)

        self._watch.add_time(0, 0, 5)

        self.assertEqual(len(self.tus_libros_api.list_cart(one_cart_id)), 0)
        self.assertEqual(len(self.tus_libros_api.list_cart(other_cart_id)), 0)

    def test19_cannot_list_purchased_with_invalid_credentials(self):
        self.assertRaises(
            RuntimeError,
            self.tus_libros_api.list_purchases,
            "Invalid client id",
            "Invalid password",
        )


if __name__ == "__main__":
    unittest.main()
