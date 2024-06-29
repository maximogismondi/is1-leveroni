class CreditCard:
    """initialize"""

    def __init__(self, number, expiration_month_in_year, name):
        self._number = number
        self._expiration_month_in_year = expiration_month_in_year
        self._name = name

    """instantiation"""

    @classmethod
    def with_number_expiration_date_and_name(
        cls, number, expiration_month_of_year, name
    ):
        return cls(number, expiration_month_of_year, name)

    """main protocol"""

    def is_expired(self, current_month_in_year):
        return self._expiration_month_in_year.is_smaller_than(current_month_in_year)

    def number(self):
        return self._number
