# pylint: disable=missing-class-docstring,missing-function-docstring,redefined-outer-name
"""Sample tests module. Note that pytest can run both pytest and unittest tests."""

import unittest

import pytest

from sample import hello_world


class TestSampleClass(unittest.TestCase):
    def setUp(self):
        self.hello = "hello world"

    def test_hello_world(self):
        self.assertEqual(self.hello, hello_world())


@pytest.fixture
def hello_world_string() -> str:
    return "hello world"


def test_sample_pytest(hello_world_string):
    assert hello_world_string == hello_world()
