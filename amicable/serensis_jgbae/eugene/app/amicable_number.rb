require 'prime'

class AmicableNumber

  def self.factors_of(number)
    primes, powers = number.prime_division.transpose                    # 220 => [[2,5,11],[2,1,1]]
    exponents = powers.map{|i| (0..i).to_a}                             # [2,1,1]=> [[0,1,2],[0,1],[0,1]]]
    divisors = exponents.shift.product(*exponents).map do |powers|
                                                                        # [[0, 0, 0], [0, 0, 1], [0, 1, 0],
                                                                        # [0, 1, 1], [1, 0, 0], [1, 0, 1],
                                                                        # [1, 1, 0], [1, 1, 1], [2, 0, 0],
                                                                        # [2, 0, 1], [2, 1, 0], [2, 1, 1]]

      primes.zip(powers).map{|prime, power| prime ** power}.inject(:*)  # [1,11,5,55,2,22,10,110,4,44,20,220]

    end
    divisors.sort.map{|div| [div, number / div]}                        # [[1, 220], [2, 110], [4, 55], [5, 44],
                                                                        # [10, 22], [11, 20], [20, 11], [22, 10],
                                                                        # [44, 5], [55, 4], [110, 2], [220, 1]]

  end

  def self.sum(number)
    factors_of(number).flatten.uniq.inject(:+)-number
  end

  def self.amicable?(number1,number2)
    sum(number1) == number2 and number1 == sum(number2)
  end

end

ary = []
(2..100000).each do |i|
  ary << [ i , AmicableNumber.sum(i)] unless Prime.prime?(i)
end

ary.each do |i|
    if i[0] < i[1]
      puts i.to_s if ary.assoc(i[1]) == [i[1],i[0]]
    end
end


