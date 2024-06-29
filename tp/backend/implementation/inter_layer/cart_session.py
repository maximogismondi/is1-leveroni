class CartSession:
    """initialize"""

    def __init__(self, cart, client_id, clock, expiration_time):
        self._cart = cart
        self._client_id = client_id
        self._clock = clock
        self.last_access = clock.now()
        self._expiration_time = expiration_time

    """instantiation"""

    @classmethod
    def with_cart_client_id_and_clock(cls, cart, client_id, clock, expiration_time):
        return cls(cart, client_id, clock, expiration_time)

    """"error messages"""

    @classmethod
    def session_expired_error_message(cls):
        return "Session expired"

    """validation"""

    def _is_expired_for(self, expiration_time):
        return (self._clock.now() - self.last_access) >= expiration_time

    def _check_expiration(self):
        if self._is_expired_for(self._expiration_time):
            raise ValueError(self.__class__.session_expired_error_message())

    """access"""

    def _update_last_access(self):
        self.last_access = self._clock.now()

    """main protocol"""

    def add_to_cart(self, book_isbn, book_quantity):
        self._check_expiration()
        self._update_last_access()
        self._cart.add_amount_of_books(book_isbn, book_quantity)

    def list_cart(self):
        self._check_expiration()
        self._update_last_access()
        return self._cart.list_books()

    def cart(self):
        self._check_expiration()
        return self._cart

    def client_id(self):
        return self._client_id
