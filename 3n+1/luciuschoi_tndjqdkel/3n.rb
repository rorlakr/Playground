class Samsu

  def initialize(i=1, j=1)
    @i = i
    @j = j
  end

  def make_3n(n)
    if n.even?
      n / 2
    else
      n * 3 + 1
    end
  end

  def generate_sequence(n)
    arr_sequence = [n]
    begin
      n = make_3n(n)
      arr_sequence << n
    end while n != 1
    arr_sequence
  end

  def max_length
    arr_size = []
    (@i..@j).each do | n |
       arr_size << generate_sequence(n).size
    end
    arr_size.max
  end

end

# Confirm
# (1..10).each do | n |
#   puts Samsu.new().generate_sequence(n).inspect
# end
# puts "=> #{Samsu.new(1,10).max_length}"


require 'benchmark'

Benchmark.bmbm(50) do | x |
  x.report("Max size of Cycle-lenth for 1~      100 : #{Samsu.new(1,       100).max_length}  => ") { Samsu.new(1,       100).max_length }
  x.report("Max size of Cycle-lenth for 1~    1,000 : #{Samsu.new(1,     1_000).max_length}  => ") { Samsu.new(1,     1_000).max_length }
  x.report("Max size of Cycle-lenth for 1~   10,000 : #{Samsu.new(1,    10_000).max_length}  => ") { Samsu.new(1,    10_000).max_length }
  x.report("Max size of Cycle-lenth for 1~  100,000 : #{Samsu.new(1,   100_000).max_length}  => ") { Samsu.new(1,   100_000).max_length }
  x.report("Max size of Cycle-lenth for 1~1,000,000 : #{Samsu.new(1, 1_000_000).max_length}  => ") { Samsu.new(1, 1_000_000).max_length }
end