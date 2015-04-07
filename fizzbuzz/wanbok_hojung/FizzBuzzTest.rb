require 'rubygems'
require 'minitest/autorun'
require 'benchmark'
require './FizzBuzz'

class TestMeme < MiniTest::Unit::TestCase
  def setup
    @fizzbuzz = FizzBuzz.new
  end

  def test_fizz
    assert_equal [1,2,'Fizz'], @fizzbuzz.get(3)
  end

  def test_buzz
    assert_equal [1,2,'Fizz',4,'Buzz'], @fizzbuzz.get(5)
  end
  
  def test_fizz_buzz_at_150
    assert_equal 'FizzBuzz', @fizzbuzz.get(150)[149]
  end
  
  def test_optimized_get_fizz_buzz_at_150
    assert_equal 'FizzBuzz', @fizzbuzz.optimized_get(150)[149]
  end
  
  def test_benchmark
    Benchmark.bm do |x|
      x.report("get") { @fizzbuzz.get(1000000) }
      x.report("optimized_get") { @fizzbuzz.optimized_get(1000000) }
    end 
  end
  
end