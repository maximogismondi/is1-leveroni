from collections import Counter


class Cart:
    """initialize"""

    def __init__(self, catalog):
        self._books = Counter()
        self._catalog = catalog

    """instantiation"""

    @classmethod
    def with_catalog(cls, catalog):
        return cls(catalog)

    """"error messages"""

    @classmethod
    def invalid_book_addition_error_message(cls, book):
        return f"Book: {book} not in catalog"

    @classmethod
    def invalid_quantity_of_book_error_message(cls):
        return "Quantity must be greater than 0"

    """validations"""

    def is_empty(self):
        return len(self._books) == 0

    def has_book(self, book):
        return book in self._books

    def _check_book_in_catalog(self, book_isbn):
        if book_isbn not in self._catalog:
            raise ValueError(
                self.__class__.invalid_book_addition_error_message(book_isbn)
            )

    def _check_valid_quantity(self, quantity):
        if quantity < 1:
            raise ValueError(self.__class__.invalid_quantity_of_book_error_message())

    """addition"""

    def _add_a_quantity_of_books(self, book_isbn, quantity):
        self._check_book_in_catalog(book_isbn)
        self._books[book_isbn] += quantity

    """main protocol"""

    def add_book(self, book_isbn):
        self._add_a_quantity_of_books(book_isbn, 1)

    def add_amount_of_books(self, book_isbn, quantity):
        self._check_valid_quantity(quantity)
        self._add_a_quantity_of_books(book_isbn, quantity)

    def list_books(self):
        return self._books.copy()

    def quantity_of_book(self, book):
        return self._books[book]

    def total_amount(self):
        return sum(
            self._catalog[book_isbn] * quantity
            for (book_isbn, quantity) in self._books.items()
        )
