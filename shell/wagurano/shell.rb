def find_the_ball start, swaps
  shells = []
  shells[start] = true
  swaps.each do |s|
    shells[s[0]], shells[s[1]] = shells[s[1]], shells[s[0]]
  end
  where = 0
  shells.each do |x|
    break if x
    where += 1
  end
  # where
  where
end
