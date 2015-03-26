module Memoization
  def memoize(name)
    @@lookup ||= Hash.new { |h, k| h[k] = {} }

    f = instance_method(name)

    define_method(name) do |args|
      return @@lookup[name][args] if @@lookup[name].include?(args)
      @@lookup[name][args] = f.bind(self).call(args)
    end
  end
end

class EvenFibo
  extend Memoization

  memoize def fibo(n)
    n <= 2 ? n : fibo( n - 1 ) + fibo( n - 2 ) 
  end

  def even_sum(n)
    sum = 0
    (1..n).each { |index|
      sum += fibo(index) if fibo(index).even?
    }
    sum
  end
  
  def sum(n)
    puts "dprecated sum method"
    self.even_sum n
  end
end

