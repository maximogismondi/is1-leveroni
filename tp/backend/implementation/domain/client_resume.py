from collections import Counter


class ClientResume:
    """initialize"""

    def __init__(self):
        self._purchased_books = Counter()
        self._total_amount = 0

    """main protocol"""

    def total_amount(self):
        return self._total_amount

    def book_quantity(self, book_name):
        return self._purchased_books[book_name]

    def list_books(self):
        return self._purchased_books.copy()

    def add_sale(self, purchase_book, total_amount):
        self._purchased_books.update(purchase_book)
        self._total_amount += total_amount
