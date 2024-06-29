from backend.implementation.inter_layer.tus_libros_api import TusLibrosAPI
from backend.implementation.domain.month_of_year import MonthOfYear


class TusLibrosHTTPInterface:
    """initialize"""

    def __init__(
            self,
            catalog,
            authenticator,
            payment_processor,
            expiration_time,
            clock,
    ):
        self._tus_libros_api = (
            TusLibrosAPI.with_catalog_auth_payment_processor_expiration_time_and_clock(
                catalog,
                authenticator,
                payment_processor,
                expiration_time,
                clock,
            )
        )

    """instantiation"""

    @classmethod
    def with_catalog_authenticator_payment_processor_expiration_time_clock(
            cls,
            catalog,
            authenticator,
            payment_processor,
            expiration_time,
            clock,
    ):

        return cls(catalog, authenticator, payment_processor, expiration_time, clock)

    """protocol constants"""
    @classmethod
    def valid_response_code(cls):
        return 200

    @classmethod
    def invalid_response_code(cls):
        return 400

    @classmethod
    def valid_message_code(cls):
        return "0"

    @classmethod
    def invalid_message_code(cls):
        return "1"

    @classmethod
    def ok_message(cls):
        return "OK"

    """error messages"""
    @classmethod
    def invalid_parameters_message(cls):
        return "Invalid parameters"

    @classmethod
    def expired_card_error_message(cls):
        return TusLibrosAPI.expired_card_error_message()

    """validation"""

    def _valid_arguments(self, content, arguments):
        return all(argument in content for argument in arguments)

    def _is_number(self, content, arguments):
        return all(content[argument].lstrip("-").isdigit() for argument in arguments)

    """serialization"""
    def _serialize_response(self, status, cart_id):
        return f"{status}|{cart_id}"

    def _serialize_valid_response(self, message):
        return self._serialize_response(self.__class__.valid_message_code(), message)

    def _serialize_invalid_response(self, message):
        return self._serialize_response(self.__class__.invalid_message_code(), message)

    """response codes"""
    def _invalid_response(self, message):
        return self.__class__.invalid_response_code(), self._serialize_invalid_response(
            message
        )
    def _valid_response(self, message):
        return self.__class__.valid_response_code(), self._serialize_valid_response(
            message
        )

    """formatting"""
    def _format_book_list(self, books):
        return "|".join([f"{isbn}|{quantity}" for (isbn, quantity) in books.items()])

    def _format_purchased_book_list(self, books):
        return "".join([f"{isbn}|{quantity}|" for (isbn, quantity) in books.items()])

    def _format_purchase_book(self, books, total_price):
        purchase_books_list = self._format_purchased_book_list(books)
        purchase_books_list += f"{total_price}"
        return purchase_books_list

    def _split_in_month_and_year(self, date):
        month = int(date[:2])
        year = int(date[2:6])
        return month, year

    def _format_date(self, date):
        month, year = self._split_in_month_and_year(date)
        return MonthOfYear.with_month_and_year(month, year)

    """error handling"""
    def _execute_action_and_handle_errors(self, action):
        try:
            return self._valid_response(action())
        except (ValueError, RuntimeError) as error:
            return self._invalid_response(str(error))

    """main protocol"""

    def create_cart(self, content):
        if not self._valid_arguments(content, ["clientId", "password"]):
            return self._invalid_response(self.__class__.invalid_parameters_message())

        client_id = content["clientId"]
        password = content["password"]

        def _create_cart():
            nonlocal client_id, password
            cart_id = self._tus_libros_api.create_cart(client_id, password)
            return cart_id

        return self._execute_action_and_handle_errors(_create_cart)

    def add_to_cart(self, content):
        if not self._valid_arguments(content, ["bookQuantity", "bookIsbn", "cartId"]):
            return self._invalid_response(self.__class__.invalid_parameters_message())

        if not self._is_number(content, ["bookQuantity"]):
            return self._invalid_response(self.__class__.invalid_parameters_message())

        cart_id = content["cartId"]
        book_isbn = content["bookIsbn"]
        book_quantity = int(content["bookQuantity"])

        def _add_to_cart():
            nonlocal cart_id, book_isbn, book_quantity
            self._tus_libros_api.add_to_cart(cart_id, book_isbn, book_quantity)
            return self.__class__.ok_message()

        return self._execute_action_and_handle_errors(_add_to_cart)

    def list_cart(self, content):
        if not self._valid_arguments(content, ["cartId"]):
            return self._invalid_response(self.__class__.invalid_parameters_message())

        cart_id = content["cartId"]

        def _list_cart():
            nonlocal cart_id
            books = self._tus_libros_api.list_cart(cart_id)
            return self._format_book_list(books)

        return self._execute_action_and_handle_errors(_list_cart)

    def checkout_cart(self, content):

        if not self._valid_arguments(content, ["ccn", "cco"]):
            return self._invalid_response(self.__class__.invalid_parameters_message())

        if not self._is_number(content, ["ccn", "cced"]):
            return self._invalid_response(self.__class__.invalid_parameters_message())

        card_id = content["cartId"]
        card_number = content["ccn"]
        card_owner = content["cco"]
        expiration_date = content["cced"]

        def _checkout_cart():
            nonlocal content, card_id, card_number, card_owner, expiration_date

            expiration_date = self._format_date(expiration_date)
            transaction_id = self._tus_libros_api.checkout_cart(
                card_id, card_number, expiration_date, card_owner
            )
            return transaction_id

        return self._execute_action_and_handle_errors(_checkout_cart)

    def list_purchases(self, content):
        client_id = content["clientId"]
        password = content["password"]

        def _list_purchases():
            nonlocal client_id, password
            client_resume = self._tus_libros_api.list_purchases(client_id, password)
            books = client_resume.list_books()
            total_price = client_resume.total_amount()

            return self._format_purchase_book(books, total_price)

        return self._execute_action_and_handle_errors(_list_purchases)
