module AmicablePair
  class Number
    attr_reader :n
    def initialize(n)
      @n = n
    end

    def proper_divisors_sum
      proper_divisors.reduce(&:+)
    end

    def pair?
      n < proper_divisors_sum &&
        pair_with?(self.class.new(proper_divisors_sum))
    end

    def pair
      pair? ? [n, proper_divisors_sum] : nil
    end

    private
    def pair_with?(other)
      proper_divisors_sum == other.n &&
        n == other.proper_divisors_sum
    end

    def proper_divisors
      @proper_divisors ||= (1..n/2).select{|i| (n % i).zero?}
    end

    def self.take_pair_while(max)
      (220..max).map { |i| new(i).pair }.compact
    end
  end
end
