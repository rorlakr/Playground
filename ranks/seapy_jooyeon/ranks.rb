def ranks(list)
  ranks = []
  list.each do |number|
    ranks << list.count {|num| number < num } + 1
  end
  [list, ranks]
end

p ranks([9,3,6,10])
p ranks([3,3,3,3,3,5,1])
