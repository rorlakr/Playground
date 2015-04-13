require "minitest/autorun"
require_relative "../lib/fibonacci_calculator.rb"

class TestFibonacciCalculator < Minitest::Test
  FIBONACCI_SAMPLE = [1, 2, 3, 5, 8, 13, 21, 34, 55].freeze
  MAX_NUMBER = FIBONACCI_SAMPLE.max
  SAMPLE_SIZE = FIBONACCI_SAMPLE.size

  def test_number
  	FIBONACCI_SAMPLE.each.with_index(1) { |n, i| assert_equal n, FibonacciCalculator.number(i) }
  end

  def test_series
  	assert_equal FIBONACCI_SAMPLE, FibonacciCalculator.series(SAMPLE_SIZE)
  end

  def test_series_less_than
    assert_equal FIBONACCI_SAMPLE, FibonacciCalculator.series_less_than(MAX_NUMBER)
  end

  def test_even_sum
    assert_equal 0, FibonacciCalculator.even_sum(1)
    assert_equal 2, FibonacciCalculator.even_sum(3)
    assert_equal 44, FibonacciCalculator.even_sum(MAX_NUMBER)
  end
end