def n3_1(n,dic)
  count = 1

  # print "#{n},"
  while(n != 1)
    count += 1

    if n.even?
      n /= 2
    else
      n = n+n+n+1
    end
    
    # print "#{n}," 
    if dic.key?(n)
      return count + dic[n] -1
    end

  end  

  count
end

def test(i,j)
  max = 0
  dic = {}

  (i..j).each do |d|
    count = n3_1(d,dic)
    dic[d] = count

    max = count if count > max

    # puts "=>#{d}, #{count}"
  end
  
  puts max
end

def test2(i,j)
  require 'pp'
  intermediate = (i..j).map{|i|[i,n3_1(i)]}
  # pp intermediate
  puts 'complete computation'
  puts 'sort'
  pp intermediate.sort{|l,r| r[1] <=> l[1]}[0]
end


if __FILE__ == $0
  test(1, 10_000_000)
end

# if __FILE__ == $0
#   # test(1, 22)
#   test(1, 22)
# end


# [525]

# 1_000_000 try 1 even?
# real  0m13.855s
# user  0m13.759s
# sys 0m0.073s

# 1_000_000 try 2 even? -> %
# real  0m15.263s
# user  0m15.075s
# sys 0m0.123

# 1_000_000 try 3 dic
# real  0m3.435s
# user  0m3.383s
# sys 0m0.042s


# 686

# real  0m42.834s
# user  0m42.340s
# sys 0m0.421s


