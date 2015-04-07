class Fibonacci 

  def even_sum maxval
    total = 0
    list = [0, 1]
    loop do
      # value = list[list.size-2] + list[list.size-1]
      value = list.last(2).reduce(:+)
      break if value > maxval
      total = total + value if value.even?
      list << value
    end
    total
  end

	def make_fibonacci maxval
    list = [0, 1]
    loop do
      # value = list[list.size-2] + list[list.size-1]
      value = list.last(2).reduce(:+)
      break if value > maxval
      list << value
    end
    list
  end

  def sum values
    total = 0
    values.each do | v |
      total += v  if v.even?
    end
    total
  end


end 