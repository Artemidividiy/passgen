import random
import string
from models.password import Password
from models.settings import Settings

alphabets = list(string.ascii_letters)
digits = list(string.digits)
special_characters = list("!@#$%^&*()")
characters = list(string.ascii_letters + string.digits + "!@#$%^&*()")

class PasswordController:
    def __init__(self, settings: Settings = None) -> None:
        tmp = self.gen(settings=settings)
        self.password = Password(
            seed=tmp[5], 
            password=tmp[0], 
            length=tmp[1], 
            alphabets_count=tmp[2], 
            digits_count=tmp[3], 
            special_characters_count=tmp[4])

    def gen(self, settings: Settings = None) -> Password:
        if settings == None: 
            seed = random.Random().randint(0, 255)
            length = 16
            alphabets_count = 10
            digits_count = 4
            special_characters_count = 2
        else: 
            seed = settings.seed
            length = settings.length
            alphabets_count = settings.alphabets_count
            digits_count = settings.digits_count
            special_characters_count = settings.special_characters_count
        password = []
        
        for i in range(alphabets_count):
            password.append(random.choice(alphabets))
        
        for i in range(digits_count):
            password.append(random.choice(digits))
        
        for i in range(special_characters_count):
            password.append(random.choice(special_characters))
        for i in range(seed):
            random.shuffle(password)
        return "".join(password), length, alphabets_count, digits_count, special_characters_count, seed
    def toString(self):
        return self.password.toString()
    def toMap(self):
        return self.password.toMap()