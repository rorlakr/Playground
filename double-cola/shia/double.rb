
def who_is_next array, next_idx
  k = 1
  n = array.size

  remain = next_idx
  while k*n < remain
    remain -= k*n
    k *= 2
  end

  return array[(remain - 1) / k]
end

puts who_is_next(["철수", "민호", "수지", "효성", "지수"], 1) == "철수"
puts who_is_next(["철수", "민호", "수지", "효성", "지수"], 52) == "수지"
puts who_is_next(["철수", "민호", "수지", "효성", "지수"], 7230702951) == "민호"
puts who_is_next(["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 1) == "Sheldon"
puts who_is_next(["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 6) == "Sheldon"
puts who_is_next(["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 1802) == "Penny"
puts who_is_next(["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 2) == "Leonard"
puts who_is_next(["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 3) == "Penny"
puts who_is_next(["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 10) == "Penny"
puts who_is_next(["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 534) == "Rajesh"
puts who_is_next(["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 5033) == "Howard"
puts who_is_next(["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 10010) == "Howard"
puts who_is_next(["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 63) == "Rajesh"
puts who_is_next(["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 841) == "Leonard"
puts who_is_next(["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 3667) == "Penny"
puts who_is_next(["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 38614) == "Howard"
puts who_is_next(["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 1745) == "Leonard"
puts who_is_next(["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 1000000000) == "Penny"
