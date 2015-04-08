require 'minitest_helper'

class TestFizzbuzz < Minitest::Test
  def test_upto
    assert_equal \
      [1, 2, 'Fizz', 4, 'Buzz', 'Fizz', 7, 8, 'Fizz', 'Buzz', 11, 'Fizz', 13, 14, 'FizzBuzz', 16],
      Fizzbuzz.new.upto(16)
  end

  def test_custom_upto
    assert_equal \
      [1, 2, 'Hoge', 4, 'Fuga', 'Hoge', 'Piyo', 8, 'Hoge', 'Fuga', 11, 'Hoge', 13, 'Piyo', 'HogeFuga', 16],
      Fizzbuzz.new(3 => 'Hoge', 5 => 'Fuga', 7 => 'Piyo').upto(16)
  end
end
