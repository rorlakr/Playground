class CalcEvenFibo
  def get_even_sum?(upper_limit)
  	array = [1, 2]
  	sum = 2

    while true
      value = array[0] + array[1]
      if(value > upper_limit)
      	break
      end

      sum += value if value.even?

      array[0] = array[1]
      array[1] = value

      puts array.to_s + ", " + sum.to_s
    end
    
    sum
  end
end
