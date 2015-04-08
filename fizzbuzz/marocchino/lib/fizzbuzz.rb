class Fizzbuzz
  attr_reader :option
  def initialize(option = nil)
    @option = option || { 3 => 'Fizz', 5 => 'Buzz' }
  end

  def upto(number)
    (1..number).map { |n| word(n) }
  end

  private

  def word(n)
    word = option.inject('') { |word, (i, v)| word + (n % i == 0 ? v : '') }
    word.empty? ? n : word
  end
end
