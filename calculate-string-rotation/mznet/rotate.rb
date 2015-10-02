def rotate(first, second)
  first.length.times { |t| return puts t if first.split("").rotate(t) == second.split("")}
  puts -1
end