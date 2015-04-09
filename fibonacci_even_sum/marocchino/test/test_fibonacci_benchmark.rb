require 'minitest_helper'
if ENV['BENCH']
  require 'minitest/benchmark'

  class TestFibonacciBenchmark < Minitest::Benchmark
    def bench_even_sum
      assert_performance_constant 0.99 do
        FibonacciEvenSum.even_sum(4_000_000)
      end
    end

    def bench_lazy_even_sum
      assert_performance_constant 0.99 do
        FibonacciEvenSum.lazy_even_sum(4_000_000)
      end
    end
  end
end
