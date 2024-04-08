import pytest
from casos_uso.suma import suma

def test_suma():
    resultado = suma(1, 2)
    assert resultado == 3
