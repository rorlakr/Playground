require "minitest/autorun"
require "minitest/benchmark"
require "./fizzbuzz.rb"

class TestFizzbuzz < Minitest::Test
  def setup
    @fiz = Fizzbuzz.new
  end

  def test_perform
    assert_equal [1,2,'Fizz',4], @fiz.perform(4)
    assert_equal [1,2,'Fizz',4,'Buzz','Fizz'], @fiz.perform(6)
    assert_equal(
      [1,2,'Fizz',4,'Buzz','Fizz',7,8,'Fizz','Buzz',11,'Fizz',13,14,'FizzBuzz',16], 
      @fiz.perform(16))
  end

  def test_output
    assert_output [1,2,'Fizz',4,''].join("\n"), nil do
      @fiz.output(4)
    end

    assert_output [1,2,'Fizz',4,'Buzz','Fizz',''].join("\n"), nil do
      @fiz.output(6)
    end

    assert_output [1,2,'Fizz',4,'Buzz','Fizz',7,8,'Fizz','Buzz',
                    11,'Fizz',13,14,'FizzBuzz',16,''].join("\n"), nil do
      @fiz.output(16)
    end 
  end
end