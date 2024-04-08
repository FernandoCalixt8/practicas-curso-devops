import pytest
from casos_uso.resta import resta

def test_resta():
    resultado = resta(2, 1)
    assert resultado == 1
