require "minitest/autorun"
require "./FizzBuzz.rb"

class TestFizzBuzz < Minitest::Test

  def setup
       @FizzBuzz = FizzBuzz.new
  end

  def test_Fizz
      assert_equal "Fizz", @FizzBuzz.fizz(3)
      assert_equal "Buzz", @FizzBuzz.fizz(5)
      assert_equal "FizzBuzz", @FizzBuzz.fizz(15)
      assert_equal "foo", @FizzBuzz.fizz(2)
  end

end