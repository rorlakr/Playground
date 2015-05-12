# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

=begin cheating using Prime class

require 'prime'

factors = Prime.prime_division(600851475143)
# => [[71, 1], [839, 1], [1471, 1], [6857, 1]]

p factors.last[0]
# => 6857

=end

require 'prime'
require 'benchmark'

the_number = 600_851_475_143

# monkeypatching
class Fixnum
  def prime? # almost O(n)
    (2..(self - 1)).each do |divisor|
      return false if self % divisor == 0
    end
    true
  end

  def factors # also almost O(n)
    result = self
    divisors = []
    (1..self).each do |divisor|
      break if result == 1
      if result % divisor == 0
        result /= divisor
        divisors << divisor
      end
    end
    divisors
  end

  def prime_factors # almost O(n^2)
    factors.select { |number| number.prime? }
  end
end

p the_number.prime_factors
p the_number.prime_factors.last # => 6857

# benchmarking
BENCH_TIMES = 10

Benchmark.bmbm do |bm|
  bm.report('Prime') do
    BENCH_TIMES.times do
      Prime.prime_division(the_number).last.first
    end
  end
  bm.report('prime_factors') do
    BENCH_TIMES.times do
      the_number.prime_factors.last
    end
  end
end
