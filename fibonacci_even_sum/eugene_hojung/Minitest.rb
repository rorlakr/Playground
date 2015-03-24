require 'minitest/autorun'
require './even_fibo'

class TestMeme < MiniTest::Unit::TestCase
  def setup
    @sumfibo = EvenFibo.new
  end

  def test_fibo_10_to_55
    assert_equal 55, @sumfibo.fibo(10)
  end

  def test_sum_10_to_44
    assert_equal 44, @sumfibo.sum(10)
  end
  
  def test_sum_1000_to_44
    assert_equal 1000000000, @sumfibo.sum(400_000)
  end
end




