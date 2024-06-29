import unittest
from backend.implementation.outer_layer.tus_libros_http_interface import (
    TusLibrosHTTPInterface,
)
from backend.implementation.inter_layer.tus_libros_api import TusLibrosAPI
from backend.implementation.inter_layer.controlable_clock import ControlableClock
from datetime import datetime, timedelta


class TusLibrosHTTPInterfaceTesting(unittest.TestCase):
    """setup"""

    def setUp(self):
        self.client_id = "valid client id"
        self.password = "valid password"

        self.invalid_client_id = "invalid client id"
        self.invalid_password = "invalid password"

        self.one_book_isbn = "one_book"
        self.another_book_isbn = "another_book"

        self.price = 10

        self.one_quantity = "1"
        self.multiple_quantities = "2"

        catalog = {self.one_book_isbn: self.price, self.another_book_isbn: self.price}

        expiration_time = timedelta(seconds=10)
        clock = ControlableClock.with_start_time(datetime.now())

        self.tus_libros_http_interface = TusLibrosHTTPInterface.with_catalog_authenticator_payment_processor_expiration_time_clock(
            catalog, self, self, expiration_time, clock
        )

    """error messages"""

    def invalid_credentials_error_message(self):
        return "Invalid credentials"

    """mocks"""

    def authenticate(self, client_id, password):
        if not (client_id == self.client_id and password == self.password):
            raise RuntimeError(self.invalid_credentials_error_message())

    def debit(self, _amount_to_debit, _credit_card):
        pass

    """parse"""

    def split_response(self, response):
        response_data = response.split("|", 1)
        code = response_data[0]
        message = response_data[1]

        return code, message

    """valid_execution"""

    def valid_create_cart(self):
        create_body_request = {"clientId": self.client_id, "password": self.password}
        _, response = self.tus_libros_http_interface.create_cart(create_body_request)
        _, cart_id = self.split_response(response)
        return cart_id

    def valid_add_to_cart(self, cart_id, book_isbn, book_quantity):
        add_body_request = {
            "cartId": cart_id,
            "bookIsbn": book_isbn,
            "bookQuantity": book_quantity,
        }

        self.tus_libros_http_interface.add_to_cart(add_body_request)

    def valid_list_cart(self, cart_id):
        list_body_request = {"cartId": cart_id}
        _, response = self.tus_libros_http_interface.list_cart(list_body_request)
        _, book_list = self.split_response(response)

        return book_list

    def valid_checkout_cart(self, cart_id):
        checkout_body_request = {
            "cartId": cart_id,
            "ccn": "123456789012",
            "cced": "122024",
            "cco": "Owner Name",
        }

        _, response = self.tus_libros_http_interface.checkout_cart(
            checkout_body_request
        )
        _, transaction_id = self.split_response(response)

        return transaction_id

    def valid_list_purchases(self):
        list_purchase_body_request = {
            "clientId": self.client_id,
            "password": self.password,
        }

        _, response = self.tus_libros_http_interface.list_purchases(
            list_purchase_body_request
        )
        _, purchases_book_list = self.split_response(response)

        return purchases_book_list

    """assertions"""

    def assert_action_body_request(
        self,
        tus_libros_http_interface_action,
        body_request,
        expected_code,
        expected_status_code,
        assert_message,
    ):
        status_code, response = tus_libros_http_interface_action(body_request)
        code, message = self.split_response(response)

        self.assertEqual(expected_code, code)
        self.assertEqual(expected_status_code, status_code)
        assert_message(message)

    def assert_action_valid_body_request(
        self, tus_libros_http_interface_action, body_request, assert_message
    ):
        self.assert_action_body_request(
            tus_libros_http_interface_action,
            body_request,
            self.tus_libros_http_interface.__class__.valid_message_code(),
            self.tus_libros_http_interface.__class__.valid_response_code(),
            assert_message,
        )

    def assert_action_invalid_body_request(
        self, tus_libros_http_interface_action, body_request, expected_error_message
    ):
        def _assert_error_message(error_message):
            nonlocal expected_error_message
            self.assertEqual(expected_error_message, error_message)

        self.assert_action_body_request(
            tus_libros_http_interface_action,
            body_request,
            self.tus_libros_http_interface.__class__.invalid_message_code(),
            self.tus_libros_http_interface.__class__.invalid_response_code(),
            _assert_error_message,
        )

    def assert_create_cart_valid_body_request(self, body_request):
        def _assert_cart_id(cart_id):
            self.assertTrue(len(cart_id) > 0)

        self.assert_action_valid_body_request(
            self.tus_libros_http_interface.create_cart,
            body_request,
            _assert_cart_id,
        )

    def assert_create_cart_invalid_body_request(
        self, body_request, expected_error_message
    ):
        self.assert_action_invalid_body_request(
            self.tus_libros_http_interface.create_cart,
            body_request,
            expected_error_message,
        )

    def assert_add_to_cart_valid_body_request(self, add_body_request):
        def _assert_ok(ok):
            self.assertEqual(self.tus_libros_http_interface.__class__.ok_message(), ok)

        self.assert_action_valid_body_request(
            self.tus_libros_http_interface.add_to_cart,
            add_body_request,
            _assert_ok,
        )

    def assert_add_to_cart_invalid_body_request(
        self, add_body_request, error_message_expected
    ):
        self.assert_action_invalid_body_request(
            self.tus_libros_http_interface.add_to_cart,
            add_body_request,
            error_message_expected,
        )

    def assert_list_carts_valid_body_request(
        self, list_body_request, list_book_expected
    ):
        def _assert_book_list(book_list):
            nonlocal list_book_expected
            self.assertEqual(list_book_expected, book_list)

        self.assert_action_valid_body_request(
            self.tus_libros_http_interface.list_cart,
            list_body_request,
            _assert_book_list,
        )

    def assert_list_carts_invalid_body_request(
        self, list_body_request, error_message_expected
    ):
        self.assert_action_invalid_body_request(
            self.tus_libros_http_interface.list_cart,
            list_body_request,
            error_message_expected,
        )

    def assert_checkout_valid_body_request(self, checkout_body_request):
        def _assert_transaction_id(transaction_id):
            self.assertTrue(len(transaction_id) > 0)

        self.assert_action_valid_body_request(
            self.tus_libros_http_interface.checkout_cart,
            checkout_body_request,
            _assert_transaction_id,
        )

    def assert_checkout_invalid_body_request(
        self, checkout_body_request, expected_error_message
    ):
        self.assert_action_invalid_body_request(
            self.tus_libros_http_interface.checkout_cart,
            checkout_body_request,
            expected_error_message,
        )

    def assert_list_purchases_valid_body_request(
        self, list_purchase_body_request, expected_list_purchase_response
    ):
        def _assert_purchases_book_list(purchases_book_response):
            nonlocal expected_list_purchase_response
            self.assertEqual(expected_list_purchase_response, purchases_book_response)

        self.assert_action_valid_body_request(
            self.tus_libros_http_interface.list_purchases,
            list_purchase_body_request,
            _assert_purchases_book_list,
        )

    def assert_list_purchases_invalid_body_request(
        self, list_purchase_body_request, expected_error_message
    ):
        self.assert_action_invalid_body_request(
            self.tus_libros_http_interface.list_purchases,
            list_purchase_body_request,
            expected_error_message,
        )

    """testing"""

    def test01_create_a_cart_with_valid_body_request(self):
        body_request = {"clientId": self.client_id, "password": self.password}
        self.assert_create_cart_valid_body_request(body_request)

    def test02_create_multiple_cart_with_valid_body_request(self):
        one_cart_id = self.valid_create_cart()
        another_cart_id = self.valid_create_cart()

        self.assertNotEqual(one_cart_id, another_cart_id)

    def test03_create_a_cart_without_cart_id(self):
        body_request = {}

        self.assert_add_to_cart_invalid_body_request(
            body_request,
            self.tus_libros_http_interface.__class__.invalid_parameters_message(),
        )

    def test04_create_a_cart_without_a_password(self):
        body_request = {"clientId": self.client_id}
        self.assert_add_to_cart_invalid_body_request(
            body_request,
            self.tus_libros_http_interface.__class__.invalid_parameters_message(),
        )

    def test05_add_book_to_cart_with_valid_body_request(self):
        cart_id = self.valid_create_cart()

        add_body_request = {
            "cartId": cart_id,
            "bookIsbn": self.one_book_isbn,
            "bookQuantity": self.one_quantity,
        }

        self.assert_add_to_cart_valid_body_request(add_body_request)

    def test06_add_book_to_an_invalid_cart(self):
        add_body_request = {
            "cartId": "1",
            "bookIsbn": self.one_book_isbn,
            "bookQuantity": self.one_quantity,
        }

        self.assert_add_to_cart_invalid_body_request(
            add_body_request, TusLibrosAPI.cart_not_found_error_message()
        )

    def test07_add_book_without_book_isbn(self):
        cart_id = self.valid_create_cart()
        add_body_request = {"cartId": cart_id, "bookQuantity": self.one_quantity}

        self.assert_add_to_cart_invalid_body_request(
            add_body_request,
            self.tus_libros_http_interface.__class__.invalid_parameters_message(),
        )

    def test08_add_book_without_book_cart_id(self):
        add_body_request = {
            "bookIsbn": self.one_book_isbn,
            "bookQuantity": self.one_quantity,
        }

        self.assert_add_to_cart_invalid_body_request(
            add_body_request,
            self.tus_libros_http_interface.__class__.invalid_parameters_message(),
        )

    def test09_list_empty_cart_with_valid_body_request(self):
        cart_id = self.valid_create_cart()
        list_body_request = {"cartId": cart_id}

        self.assert_list_carts_valid_body_request(list_body_request, "")

    def test10_list_cart_with_a_book_with_valid_body_request(self):
        cart_id = self.valid_create_cart()

        self.valid_add_to_cart(cart_id, self.one_book_isbn, self.one_quantity)

        list_body_request = {"cartId": cart_id}

        expected_book_list = f"{self.one_book_isbn}|{self.one_quantity}"

        self.assert_list_carts_valid_body_request(list_body_request, expected_book_list)

    def test11_list_cart_with_multiples_books_with_valid_body_request(self):
        cart_id = self.valid_create_cart()

        self.valid_add_to_cart(cart_id, self.one_book_isbn, self.one_quantity)
        self.valid_add_to_cart(cart_id, self.another_book_isbn, self.one_quantity)

        list_body_request = {"cartId": cart_id}

        expected_book_list = f"{self.one_book_isbn}|{self.one_quantity}|{self.another_book_isbn}|{self.one_quantity}"

        self.assert_list_carts_valid_body_request(list_body_request, expected_book_list)

    def test12_list_cart_with_invalid_id(self):
        list_body_request = {"cartId": "1"}

        self.assert_list_carts_invalid_body_request(
            list_body_request, TusLibrosAPI.cart_not_found_error_message()
        )

    def test13_list_cart_without_card_id(self):
        list_body_request = {}

        self.assert_list_carts_invalid_body_request(
            list_body_request,
            self.tus_libros_http_interface.__class__.invalid_parameters_message(),
        )

    def test14_list_multiples_books_with_same_isbn(self):
        cart_id = self.valid_create_cart()

        self.valid_add_to_cart(cart_id, self.one_book_isbn, self.multiple_quantities)

        list_body_request = {"cartId": cart_id}

        expected_book_list = f"{self.one_book_isbn}|{self.multiple_quantities}"

        self.assert_list_carts_valid_body_request(list_body_request, expected_book_list)

    def test15_add_book_without_quantity(self):
        cart_id = self.valid_create_cart()
        add_body_request = {"cartId": cart_id, "bookIsbn": self.one_book_isbn}

        self.assert_add_to_cart_invalid_body_request(
            add_body_request,
            self.tus_libros_http_interface.__class__.invalid_parameters_message(),
        )

    def test16_add_book_with_invalid_quantity(self):
        cart_id = self.valid_create_cart()

        add_body_request = {
            "cartId": cart_id,
            "bookIsbn": self.one_book_isbn,
            "bookQuantity": "invalid_book_quantity",
        }

        self.assert_add_to_cart_invalid_body_request(
            add_body_request,
            self.tus_libros_http_interface.__class__.invalid_parameters_message(),
        )

    def test17_create_cart_with_invalid_credentials(self):
        create_body_request = {
            "clientId": "invalid_client_id",
            "password": "invalid_password",
        }

        self.assert_create_cart_invalid_body_request(
            create_body_request,
            self.invalid_credentials_error_message(),
        )

    def test18_checkout_a_cart_with_valid_body_request(self):
        cart_id = self.valid_create_cart()

        self.valid_add_to_cart(cart_id, self.one_book_isbn, self.one_quantity)

        checkout_body_request = {
            "cartId": cart_id,
            "ccn": "1234567890123456",
            "cced": "122024",
            "cco": "Owner Name",
        }

        self.assert_checkout_valid_body_request(checkout_body_request)

    def test19_checkout_a_cart_with_expired_card_with_valid_body_request(self):
        cart_id = self.valid_create_cart()

        self.valid_add_to_cart(cart_id, self.one_book_isbn, self.one_quantity)

        checkout_body_request = {
            "cartId": cart_id,
            "ccn": "1234567890123456",
            "cced": "122023",
            "cco": "Owner Name",
        }

        self.assert_checkout_invalid_body_request(
            checkout_body_request,
            self.tus_libros_http_interface.__class__.expired_card_error_message(),
        )

    def test20_checkout_with_invalid_expiration_date(self):
        checkout_body_request = {
            "cartId": "1",
            "ccn": "1234567890123456",
            "cced": "number",
            "cco": "Owner Name",
        }

        self.assert_checkout_invalid_body_request(
            checkout_body_request,
            self.tus_libros_http_interface.__class__.invalid_parameters_message(),
        )

    def test21_checkout_without_credit_cart_number(self):
        checkout_body_request = {"cartId": "1", "cced": "122024", "cco": "Owner Name"}

        self.assert_checkout_invalid_body_request(
            checkout_body_request,
            self.tus_libros_http_interface.__class__.invalid_parameters_message(),
        )

    def test22_checkout_without_credit_cart_owner(self):
        checkout_body_request = {
            "cartId": "1",
            "ccn": "1234567890123456",
            "cced": "122024",
        }

        self.assert_checkout_invalid_body_request(
            checkout_body_request,
            self.tus_libros_http_interface.__class__.invalid_parameters_message(),
        )

    def test23_list_purchases_without_any_previous_purchase(self):
        list_purchase_body_request = {
            "clientId": self.client_id,
            "password": self.password,
        }

        self.assert_list_purchases_valid_body_request(list_purchase_body_request, "0")

    def test24_list_purchases_with_one_purchase(self):
        cart_id = self.valid_create_cart()

        self.valid_add_to_cart(cart_id, self.one_book_isbn, self.one_quantity)

        self.valid_checkout_cart(cart_id)

        list_purchase_body_request = {
            "clientId": self.client_id,
            "password": self.password,
        }

        expected_purchase_book_list = (
            f"{self.one_book_isbn}|{self.one_quantity}|{self.price}"
        )

        self.assert_list_purchases_valid_body_request(
            list_purchase_body_request, expected_purchase_book_list
        )

    def test25_list_purchases_with_multiples_purchase_of_the_same_book(self):
        cart_id = self.valid_create_cart()

        self.valid_add_to_cart(cart_id, self.one_book_isbn, self.multiple_quantities)

        self.valid_checkout_cart(cart_id)

        list_purchase_body_request = {
            "clientId": self.client_id,
            "password": self.password,
        }

        expected_purchase_book_list = (
            f"{self.one_book_isbn}|{self.multiple_quantities}|{2 * self.price}"
        )

        self.assert_list_purchases_valid_body_request(
            list_purchase_body_request, expected_purchase_book_list
        )

    def test26_list_purchases_with_multiples_purchase_of_different_books(self):
        cart_id = self.valid_create_cart()

        self.valid_add_to_cart(cart_id, self.one_book_isbn, self.one_quantity)
        self.valid_add_to_cart(cart_id, self.another_book_isbn, self.one_quantity)

        self.valid_checkout_cart(cart_id)

        list_purchase_body_request = {
            "clientId": self.client_id,
            "password": self.password,
        }

        expected_purchase_book_list = f"{self.one_book_isbn}|{self.one_quantity}|{self.another_book_isbn}|{self.one_quantity}|{2 * self.price}"

        self.assert_list_purchases_valid_body_request(
            list_purchase_body_request, expected_purchase_book_list
        )

    def test27_list_purchases_with_invalid_credentials(self):
        list_purchase_body_request = {
            "clientId": self.invalid_client_id,
            "password": self.invalid_password,
        }

        self.assert_list_purchases_invalid_body_request(
            list_purchase_body_request,
            self.invalid_credentials_error_message(),
        )


if __name__ == "__main__":
    unittest.main()
