module Josephus
  module_function

  def round(k)
    i = (@list.size > k ? @offset % @list.size : @offset)
    result = []

    @offset = k - 1 - (@list.size - @offset - 1) % k 
    result << @list.delete_at(i)
    (i+k-1).step(@list.size, k-1) do |d|
      break unless @list.size > d
      result << @list.delete_at(d)
    end
    true
  end

  def full(n,k)
    @list = (1..n).to_a
    @offset = k-1
    round(k) until @list.size < 2
  end

  def surviver
    @list.first
  end
end

Josephus.full(10,3)
p Josephus.surviver == 4
