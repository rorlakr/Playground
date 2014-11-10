self_number=[]
arr_number = []
5000.times do | i |
  real_number = i + 1
  temp_str = real_number.to_s
  str_len = temp_str.length
  sum = 0
  str_len.times do | j |
    sum += temp_str[j].to_i
  end
  sum += real_number
  arr_number << sum
end


5000.times do |i|
 re = i+1
 if !arr_number.include?(re)
    self_number << re
 end
end

puts self_number.inject(:+)