from backend.implementation.domain.client_resume import ClientResume
from backend.implementation.domain.month_of_year import MonthOfYear
from collections import defaultdict


class Cashier:
    """initialize"""

    def __init__(self, clock, payment_processor):
        self._clock = clock
        self._payment_processor = payment_processor
        self._sales_book = defaultdict(ClientResume)

    """instantiation"""

    @classmethod
    def with_clock_and_payment_processor(cls, clock, payment_processor):
        return cls(clock, payment_processor)

    """"error messages"""

    @classmethod
    def empty_cart_error_message(cls):
        return "Empty cart"

    @classmethod
    def expired_card_error_message(cls):
        return "Expired credit card"

    @classmethod
    def invalid_client_error_message(cls):
        return "Invalid client"

    """addition"""

    def _add_resume_to_sales_book(self, client, purchased_book_list, total_amount):
        self._sales_book[client].add_sale(purchased_book_list, total_amount)

    """validations"""

    def _current_month(self):
        current_datetime = self._clock.now()
        current_month = current_datetime.month
        current_year = current_datetime.year

        return MonthOfYear.with_month_and_year(current_month, current_year)

    def _check_valid_cart(self, cart):
        if cart.is_empty():
            raise ValueError(self.__class__.empty_cart_error_message())

    def _check_valid_card(self, card):
        if card.is_expired(self._current_month()):
            raise ValueError(self.__class__.expired_card_error_message())

    """main protocol"""

    def checkout(self, cart, client, card):
        self._check_valid_cart(cart)
        self._check_valid_card(card)

        book_list = cart.list_books()
        total_amount = cart.total_amount()

        self._payment_processor.debit(total_amount, card)
        self._add_resume_to_sales_book(client, book_list, total_amount)

    def list_sales(self, client):
        return self._sales_book[client]
