require "minitest/autorun"
require "minitest/benchmark"
require "./my_prime.rb"
require "benchmark"

class TestPrime < Minitest::Test
  def setup
    @prime = MyPrime.new
  end

  def test_max_division
    assert_equal 3, @prime.max_division(12)
    assert_equal 6857, @prime.max_division(600851475143)
  end

  def test_max_division2
    # assert_equal 2, @prime.max_division2(8)
    assert_equal 3, @prime.max_division2(12)
    assert_equal 6857, @prime.max_division2(600851475143)
  end

  def test_max_division3
    assert_equal 2, @prime.max_division3(8)
    assert_equal 3, @prime.max_division3(12)
    # assert_equal 6857, @prime.max_division3(600851475143)
  end

  def test_max_division_bench
    Benchmark.bmbm do |x|
      x.report("1") { @prime.max_division(10000) }
      x.report("3") { @prime.max_division3(10000) }
    end
  end

end
