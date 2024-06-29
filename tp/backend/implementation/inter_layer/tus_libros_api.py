from backend.implementation.domain.cart import Cart
from backend.implementation.domain.cashier import Cashier
from backend.implementation.domain.credit_card import CreditCard
from itertools import count
from backend.implementation.inter_layer.cart_session import CartSession


class TusLibrosAPI:
    """initialize"""

    def __init__(
        self,
        catalog,
        authenticator,
        payment_processor,
        expiration_time,
        clock,
    ):
        self._catalog = catalog
        self._authenticator = authenticator
        self._cart_sessions = {}
        self._cashier = Cashier.with_clock_and_payment_processor(
            clock, payment_processor
        )
        self._cart_id_generator = count(1)
        self._transaction_id_generator = count(1)
        self._expiration_time = expiration_time
        self._clock = clock

    """instantiation"""

    @classmethod
    def with_catalog_auth_payment_processor_expiration_time_and_clock(
        cls,
        catalog,
        authenticator,
        payment_processor,
        expiration_time,
        clock,
    ):
        return cls(
            catalog,
            authenticator,
            payment_processor,
            expiration_time,
            clock,
        )

    """error messages"""

    @classmethod
    def cart_not_found_error_message(cls):
        return "Cart not found"

    @classmethod
    def expired_card_error_message(cls):
        return Cashier.expired_card_error_message()

    """id generators"""

    def _generate_cart_id(self):
        return str(next(self._cart_id_generator))

    def _generate_transaction_id(self):
        return str(next(self._transaction_id_generator))

    """validation"""

    def _check_session_exist(self, cart_session_id):
        if cart_session_id not in self._cart_sessions:
            raise ValueError(self.__class__.cart_not_found_error_message())

    """main protocol"""

    def create_cart(self, client_id, password):
        self._authenticator.authenticate(client_id, password)

        cart_session_id = self._generate_cart_id()
        cart = Cart.with_catalog(self._catalog)
        cart_session = CartSession.with_cart_client_id_and_clock(
            cart, client_id, self._clock, self._expiration_time
        )

        self._cart_sessions[cart_session_id] = cart_session
        return cart_session_id

    def list_cart(self, cart_session_id):
        self._check_session_exist(cart_session_id)
        return self._cart_sessions[cart_session_id].list_cart()

    def add_to_cart(self, cart_session_id, book_isbn, book_quantity):
        self._check_session_exist(cart_session_id)
        self._cart_sessions[cart_session_id].add_to_cart(book_isbn, book_quantity)

    def checkout_cart(self, cart_session_id, card_number, expiration_date, card_owner):
        self._check_session_exist(cart_session_id)

        card = CreditCard.with_number_expiration_date_and_name(
            card_number, expiration_date, card_owner
        )

        cart_session = self._cart_sessions[cart_session_id]
        cart = cart_session.cart()
        client_id = cart_session.client_id()

        self._cashier.checkout(cart, client_id, card)
        self._cart_sessions.pop(cart_session_id)

        return self._generate_transaction_id()

    def list_purchases(self, client_id, password):
        self._authenticator.authenticate(client_id, password)

        return self._cashier.list_sales(client_id)
