require 'minitest/autorun'
require './even_fibo'

class TestMeme < MiniTest::Unit::TestCase
  def setup
    @sumfibo = EvenFibo.new
  end

  def test_fibo_10_to_89
    assert_equal 89, @sumfibo.fibo(10)
  end

  def test_even_sum_10_to_44
    assert_equal 44, @sumfibo.even_sum(10)
  end
  
  def test_evne_sum_not_over_400_000
    @sumfibo = EvenFibo.new

    fibo_result = fibo_n = 0

    while fibo_result < 200_000 do
      fibo_n += 1
      fibo_result = @sumfibo.fibo(fibo_n)
    end

    assert_equal 257114, @sumfibo.even_sum(fibo_n)
  end
end