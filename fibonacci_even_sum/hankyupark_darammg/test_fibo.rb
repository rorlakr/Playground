require "minitest/autorun"
require "./fibonacci.rb"

class TestFibonacci < Minitest::Test
  def setup
    @fibo = CalcEvenFibo.new
  end

  def test_upper_limit_10
    assert_equal 10, @fibo.get_even_sum?(10)
  end

  def test_upper_limit_100
    assert_equal 44, @fibo.get_even_sum?(100)
  end

  def test_upper_limit_1000
    assert_equal 798, @fibo.get_even_sum?(1000)
  end

  
end

