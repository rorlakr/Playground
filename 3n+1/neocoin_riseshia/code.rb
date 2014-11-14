$dic = {1 => 1}

def n3_1(n)
  count = 1
  route = [n]

  while(n != 1)
    if n & 1 == 0
      n = n >> 1
    else
      n = 3*n + 1
    end

    # puts "#{n}, #{count}"
    if $dic.key?(n)
      count = count + $dic[n] - 1
      break
    else
      route << n
      count += 1
    end
  end
  count += 1 # for 1

  # puts "result #{count}"
  temp = count
  route.each do |el|
    $dic[el] = temp
    temp -= 1
  end

  count
end

def test(i,j)
  max = 0

  # Swap variable if i is small
  if i > j
    i,j = j,i
  end

  # check
  d = i
  last = j+1
  while(d < last)
    unless $dic.key?(d)
      count = n3_1(d)
      max = count if count > max
    end

    if $dic.key?(d+1)
      d += 2
      if $dic.key?(d+2)
        d += 3
        if $dic.key?(d+3)
          d += 4
        end
      end
    else
      d += 1
    end
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

test(1,1_000_000)

# 525

# real  0m2.553s
# user  0m2.466s
# sys 0m0.072s
