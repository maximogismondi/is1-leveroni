import unittest
from backend.implementation.domain.cart import Cart


class CartTesting(unittest.TestCase):
    """setup"""

    def setUp(self):
        self.one_book = "Book 1"
        self.one_book_price = 10

        self.another_book = "Book 2"
        self.another_book_price = 20

        self.catalog = {
            self.one_book: self.one_book_price,
            self.another_book: self.another_book_price,
        }
        self.cart = Cart.with_catalog(self.catalog)

    """assertions"""

    def assert_total_amount(self, expected_price):
        total_price = self.cart.total_amount()
        self.assertEqual(expected_price, total_price)

    """testing"""

    def test01_cart_without_books_is_empty(self):
        self.assertTrue(self.cart.is_empty())

    def test02_cart_with_a_book_is_not_empty(self):
        self.cart.add_book(self.one_book)

        self.assertFalse(self.cart.is_empty())

    def test03_not_added_book_is_not_in_cart(self):
        self.assertFalse(self.cart.has_book(self.one_book))

    def test04_cart_contains_the_added_book(self):
        self.cart.add_book(self.one_book)

        self.assertTrue(self.cart.has_book(self.one_book))

    def test05_cart_contains_multiples_addedBooks(self):
        self.cart.add_book(self.one_book)
        self.cart.add_book(self.another_book)

        self.assertTrue(self.cart.has_book(self.one_book))
        self.assertTrue(self.cart.has_book(self.another_book))

    def test06_book_not_in_catalog_fail_addition_to_cart(self):
        invalid_book = "Invalid Book"

        self.assertRaises(ValueError, self.cart.add_book, invalid_book)
        self.assertFalse(self.cart.has_book(invalid_book))

    def test07_cart_list_all_their_books(self):
        self.cart.add_book(self.one_book)
        books = self.cart.list_books()

        self.assertTrue(self.one_book in books)

    def test08_cart_adds_a_quantity_of_books(self):
        self.cart.add_amount_of_books(self.one_book, 2)

        self.assertEqual(self.cart.quantity_of_book(self.one_book), 2)

    def test09_cart_adds_the_same_book_multiple_times(self):
        self.cart.add_book(self.one_book)
        self.cart.add_book(self.one_book)

        self.assertEqual(self.cart.quantity_of_book(self.one_book), 2)

    def test10_invalid_quantity_fail_addition_to_cart(self):
        self.assertRaises(ValueError, self.cart.add_amount_of_books, self.one_book, 0)
        self.assertFalse(self.cart.has_book(self.one_book))

    def test11_cart_total_amount_with_a_book(self):
        self.cart.add_book(self.one_book)

        self.assert_total_amount(self.one_book_price)

    def test13_cart_total_amount_with_different_books(self):
        self.cart.add_book(self.one_book)
        self.cart.add_book(self.another_book)

        self.assert_total_amount(self.one_book_price + self.another_book_price)

    def test14_cart_total_amount_with_multiple_copies_of_the_same_book(self):
        self.cart.add_amount_of_books(self.one_book, 2)

        self.assert_total_amount(self.one_book_price * 2)


if __name__ == "__main__":
    unittest.main()
