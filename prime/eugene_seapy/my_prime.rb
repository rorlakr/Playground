require 'prime'

class MyPrime

  def max_division(n)
    divisions = Prime.prime_division(n)
    divisions.last.first
  end

  def max_division2(number)
    max_prime = 0
    i = 1
    loop do
      i += 1
      if number % i == 0
        max_prime = i
        number = number / i
      else
        break if i > number
      end
    end
    max_prime
  end

  def max_division3(num , i = 2)
    return i if num == 1 || num == i
    num % i == 0 ? max_division3( num / i, i ) : max_division3( num ,  i + 1 )
  end

end