require 'prime'

def getprimes(number)
  primes = [2]
  pcount=1
  3.step(number, 2).each do |i|
    j=1
    puts "i: #{i}"
    (1...pcount).each do |idx|
      puts "==> #{pcount}, #{idx}"
      if i % primes[idx] == 0
        j=idx
        break
      end
    end
    puts "j: #{j}, pcount: #{pcount}"
    if j == pcount
      primes[pcount] = i
      print "prime: "
      p primes
      pcount += 1
    end
  end
  primes
end

# p getprimes 100
# a = 10
# b = 1 + Prime.first(a).inject(:+)
# c = Prime.first(b).inject(:+)
# puts a, b, c

primes = Prime.first(10000)

def sigma n
  sum = 1primes = Prime.first(10000)

  t = n
  (0...10000).each do |i|
    r = 1
    while t % primes[i] == 0
      r = r * primes[i] + 1
      t /= primes[i]
    end
    sum *= r
  end
  sum
end

# (1..10000).each do |i|
#   s = 
# end