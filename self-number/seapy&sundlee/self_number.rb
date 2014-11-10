# 정창훈(seapy), 이용해(sundlee)

require 'benchmark'

class SelfNumber
  attr_accessor :numbers

  def initialize
    @numbers = 1.upto(5000).to_a
    1.upto(5000).each do |num|
      @numbers.delete(d(num))
    end
  end

  def count
    @numbers.count
  end

  def sum
    @numbers.inject(:+)
  end

  private
  def d(number)
    result = 0
    to_chars(number).each do |decomped|
      result = result + decomped
    end
    result + number
  end

  def to_chars(number)
    chars = []
    strings = number.to_s
    0.upto(strings.size).each do |index|
      chars << strings[index].to_i
    end
    chars
  end
end

puts Benchmark.measure {
  self_number = SelfNumber.new
  puts self_number.numbers.inspect
  puts self_number.count
  puts self_number.sum
}
