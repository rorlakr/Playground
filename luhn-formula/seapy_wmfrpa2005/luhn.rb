credit_number = '79927398713'

odd_numbers = []
even_numbers = []

credit_number.chars.reverse.each_with_index do |number, index|
  if index.odd?
    odd_numbers << number.to_i
  else
    even_numbers << number.to_i
  end
end

odd_numbers2 = [] 
odd_numbers.each do |number|
  odd_numbers2 << number*2
end

total = 0
even_numbers.each do |even|
  total = total + even
end

odd_numbers2.each do |odd|
  if odd > 9
    odd_total = 0
    odd.to_s.chars.each do |od|
      odd_total = odd_total + od.to_i
    end
    total = total + odd_total
  else
    total = total + odd
  end
end

p "total : #{total}"