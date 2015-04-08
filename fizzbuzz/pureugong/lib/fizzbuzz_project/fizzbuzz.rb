class FizzbuzzProject::Fizzbuzz 
	attr_reader :n
	
	def initialize(n)
		@n = n
	end

	def go
		1.upto(n).map{ |num| fizzbuzz num }.join
	end

	def fizzbuzz(num)
		return "FizzBuzz" if num % 3 == 0 && num % 5 == 0
		return "Fizz" if num % 3 == 0
		return "Buzz" if num % 5 == 0
		num
	end
end