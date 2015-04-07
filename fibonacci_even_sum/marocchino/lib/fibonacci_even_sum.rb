module FibonacciEvenSum
  module_function

  def take_less_than(number)
    fibo.take_while { |n| n < number }
  end

  def even_sum(number)
    take_less_than(number).select(&:even?).reduce(:+)
  end

  def fibo
    @fibo ||=
      Enumerator.new do |yielder|
        i, j = 0, 1
        loop do
          i, j = j, i + j
          yielder.yield i
        end
      end
  end
end
