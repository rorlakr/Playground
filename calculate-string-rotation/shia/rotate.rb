def shifted_diff(first, second)
  return -1 if first.size != second.size or second.size == 0
  
  double = second * 2
  double.scan(first).empty? ? -1 : double.index(first)
end
