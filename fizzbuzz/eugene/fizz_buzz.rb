class FizzBuzz
  attr_accessor :limit

  def initialize(limit = 0)
    @limit = limit
    @output = (1..@limit)
  end

  def fizz
    # 각 자리수를 따로 더한 숫자가 3의 배수가 되면 원래의 수는 3의 배수
    @output.collect { |v| (v.to_s.chars.map(&:to_i).reduce(:+)) % 3 == 0 ? "fizz": v  }
  end

  def fizz_buzz
    fizz = fizz()
    # 마지막 숫자가 5 또는 0 이면 5의 배수
    fizz.map.with_index(1) { |e,i| ['5', '0'].include?(i.to_s[-1]) ? e.to_s.gsub(/[\d.+]/, '')  << "buzz" : e }
  end
end

fz = FizzBuzz.new 1_000
fz.fizz_buzz().each { |e| puts e }
