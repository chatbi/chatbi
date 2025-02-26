import uuid

from chatbi.cache.base import Cache


class MemoryCache(Cache):
    def __init__(self):
        self.cache = {}

    def generate_id(self, *args, **kwargs):
        return str(uuid.uuid4())

    def get(self, id, field):
        if id in self.cache:
            return self.cache[id][field]

        return None

    def set(self, id, field, value):
        if id not in self.cache:
            self.cache[id] = {}

        self.cache[id][field] = value

    def delete(self, id):
        if id in self.cache:
            del self.cache[id]

    def get_all(self) -> list:
        return [self.cache.get(id) for id in self.cache]
