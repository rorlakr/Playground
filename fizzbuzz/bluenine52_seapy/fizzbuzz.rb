class Fizzbuzz
  def perform(n)
    result_list = []
    1.upto(n).each do |number|
      is_multiply_3 = number % 3 == 0
      is_multiply_5 = number % 5 == 0
      if is_multiply_3 && is_multiply_5
        result_list << 'FizzBuzz'
      elsif is_multiply_3
        result_list << 'Fizz'
      elsif is_multiply_5
        result_list << 'Buzz'
      else
        result_list << number
      end
    end
    result_list
  end

  def output(n) 
    1.upto(n).each do |number|
      tmp = ''
      tmp += 'Fizz' if number % 3 == 0
      tmp += 'Buzz' if number % 5 == 0
      print (tmp.empty? ? number : tmp)
      print "\n"
    end
  end
end