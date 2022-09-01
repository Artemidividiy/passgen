from dataclasses import dataclass


@dataclass
class Password:
    password: str
    seed: int
    length: int
    alphabets_count: int
    digits_count: int
    special_characters_count: int
    def toMap(self):
        return {
            "password": self.password,
            "seed": self.seed,
            "length": self.length,
            "alphabets_count": self.alphabets_count,
            "digits_count": self.digits_count,
            "special_characters_count": self.special_characters_count,
        }