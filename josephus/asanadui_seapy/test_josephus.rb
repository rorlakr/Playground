require "minitest/autorun"
require "minitest/benchmark"
require "./josephus.rb"
require "benchmark"

class TestJosephus < Minitest::Test
  def setup
    @jose = Josephus.new
  end

  def test_survivor
    assert_equal 4, @jose.survivor(n: 7, k: 3)
    assert_equal 3, @jose.survivor(n: 5, k: 2)
    assert_equal 4, @jose.survivor(n: 10, k: 3)
    assert_equal 31, @jose.survivor(n: 41, k: 3)
    assert_equal 7, @jose.survivor(n: 66, k: 100)
    assert_equal 609, @jose.survivor(n: 1000, k: 1000)
  end

  def test_survivor_list
    @jose.survivor(n: 7, k: 3)
    assert_equal [3,6,2,7,5,1,4], @jose.survivor_list
  end
end
