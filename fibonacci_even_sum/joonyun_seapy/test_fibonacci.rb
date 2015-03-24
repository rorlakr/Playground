require "minitest/autorun"
require "./fibonacci.rb"

class TestFibonacci < Minitest::Test
  def setup
    @fibo = Fibonacci.new
  end

  def test_even_sum 
    assert_equal 10 , @fibo.even_sum(10)
    assert_equal 44 , @fibo.even_sum(90)
    assert_equal 257_114, @fibo.even_sum(400_000)
  end

  def test_make_fibonacci
    assert_equal [0, 1, 1, 2, 3, 5, 8], @fibo.make_fibonacci(10)
    assert_equal [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89], @fibo.make_fibonacci(90)
  end

  def test_sum 
    assert_equal 10 , @fibo.sum([0, 1, 1, 2, 3, 5, 8])   
    assert_equal 44 , @fibo.sum([0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89])   
  end

  def test_result
    # 257114
    puts @fibo.even_sum(400_000)
  end

end