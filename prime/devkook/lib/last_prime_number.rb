require 'benchmark'

class LastPrimeNumber
 
 def initialize
 end

 def hi
   'hi'
 end

 def big_prime(n)
 	i = n
 	p_array = []

 	for p in 2..n
 		break if p > i #0.011103855002147611 : 0.009555416996590793
 		if is_prime_number(p)
 			while i % p == 0
 				p_array << p
 				i = i / p
 			end
 		end
 	end

 	p_array.last
 end

 def is_prime_number(n)
 	return false if 2 > n

 	for p in 2..n
 		return p == n if n % p == 0	
 	end
 end
end

Benchmark.bm do |x|
  x.report {
    lpn = LastPrimeNumber.new
    lpn.big_prime(27637)
  }
  x.report {
    
  }
end


