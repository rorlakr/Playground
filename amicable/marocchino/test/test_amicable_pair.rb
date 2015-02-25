require 'minitest_helper'

class TestAmicablePair < MiniTest::Unit::TestCase
  def test_that_it_has_a_version_number
    refute_nil ::AmicablePair::VERSION
  end

  def test_number_proper_divisors_sum
    number1 = AmicablePair::Number.new(220)
    assert_equal 284, number1.proper_divisors_sum
    number2 = AmicablePair::Number.new(284)
    assert_equal 220, number2.proper_divisors_sum
  end

  def test_number_pair
    number = AmicablePair::Number.new(220)
    assert_equal number.pair, [220, 284]
  end

  def test_take_while
    assert_equal \
      [[220, 284], [1184, 1210], [2620, 2924], [5020, 5564], [6232, 6368]],
      AmicablePair::Number.take_pair_while(10_000)
  end
end
