require 'minitest_helper'

class TestFibonacciEvenSum < Minitest::Test
  def test_take_less_than
    assert_equal FibonacciEvenSum.take_less_than(10), [1, 1, 2, 3, 5, 8]
  end

  def test_even_sum
    assert_equal FibonacciEvenSum.even_sum(10),      10
    assert_equal FibonacciEvenSum.even_sum(400_000), 257_114
  end
end
