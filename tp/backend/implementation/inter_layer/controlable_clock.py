from datetime import timedelta


class ControlableClock:
    """initialize"""

    def __init__(self, date_time):
        self._date_time = date_time.replace(microsecond=0)

    """instantiation"""

    @classmethod
    def with_start_time(cls, date_time):
        return cls(date_time)

    """main protocol"""

    def add_time(self, hour, minutes, seconds):
        self._date_time = self._date_time + timedelta(
            hours=hour, minutes=minutes, seconds=seconds
        )

    def now(self):
        return self._date_time
