class MonthOfYear:
    """initialize"""

    def __init__(self, month, year):
        self.month = month
        self.year = year

    """instantiation"""

    @classmethod
    def with_month_and_year(cls, month, year):
        if month > 12:
            raise ValueError(cls.invalid_month_error_message())
        return cls(month, year)

    """error messages"""

    @classmethod
    def invalid_month_error_message(cls):
        return ValueError("Invalid month")

    """main protocol"""

    def is_smaller_than(self, other):
        if self.year < other.year:
            return True
        if self.year == other.year and self.month < other.month:
            return True

        return False
