from dataclasses import dataclass


@dataclass
class Settings:
    seed: int
    length: int
    alphabets_count: int
    digits_count: int
    special_characters_count: int
    password_count: int
    def fromMap(d: dict):
        return Settings(seed=d["seed"],
            password_count=d["password_count"],
            length=d["length"],
            alphabets_count=d["alphabets_count"],
            digits_count=d["digits_count"],
            special_characters_count=d["special_characters_count"]
        )