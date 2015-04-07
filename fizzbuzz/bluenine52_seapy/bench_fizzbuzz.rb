require "minitest/autorun"
require "minitest/benchmark"
require "./fizzbuzz.rb"

class BenchFizzbuzz < Minitest::Benchmark
  def setup
    @fiz = Fizzbuzz.new
  end

  def bench_perform
    assert_performance_constant 0.9999 do |n| 
      @fiz.perform(n)
    end
  end

  # def bench_output
  #   assert_performance_constant 0.9999 do |n| 
  #     # @fiz.perform(n)
  #     # @fiz.output(n)
  #   end
  # end
end