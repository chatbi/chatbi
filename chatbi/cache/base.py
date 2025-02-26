from abc import ABC, abstractmethod


class Cache(ABC):
    """
    Define the interface for a cache that can be used to store data in a Flask app.
    """

    @abstractmethod
    def generate_id(self, *args, **kwargs):
        """
        Generate a unique ID for the cache.
        """

    @abstractmethod
    def get(self, id, field):
        """
        Get a value from the cache.
        """

    @abstractmethod
    def get_all(self, field_list) -> list:
        """
        Get all values from the cache.
        """

    @abstractmethod
    def set(self, id, field, value):
        """
        Set a value in the cache.
        """

    @abstractmethod
    def delete(self, id):
        """
        Delete a value from the cache.
        """
