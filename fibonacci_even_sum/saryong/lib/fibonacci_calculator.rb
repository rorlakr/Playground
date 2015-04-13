module FibonacciCalculator
  module_function

  def number(n)
    n <= 2 ? n : number(n - 1) + number(n - 2)
  end

  def series(n)
    natural_numbers.map { |i| number(i) }.first(n)
  end

  def series_less_than(max_number)
    natural_numbers.map { |i| number(i) }.take_while { |n| n <= max_number }.force
  end

  def even_sum(max_number)
  	series_less_than(max_number).select(&:even?).reduce(:+) || 0
  end

  def natural_numbers
    (1..Float::INFINITY).lazy
  end
end