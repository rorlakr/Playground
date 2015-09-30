def shifted_diff(first, second)
  arr = first.split('')
  arr.size.times do |idx|
    return idx if arr.rotate(-idx) == second.split('')
  end
  # a.rotate(-i)
  # a[-1]+a[0..-2]
  -1
end
