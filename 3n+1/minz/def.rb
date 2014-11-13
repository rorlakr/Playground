@count = 1
@arr = [] 

def cal (paramx)
	
	if @result != 1 
		if paramx.even?
			@result = paramx / 2
			@count += 1
		elsif paramx.odd?
			@result = (paramx * 3 ) + 1
			@count += 1
		end

		cal(@result)
	
	elsif @result == 1
		return @count
	end

end

def start(i,j)
	(i..j).each{|x| 
		cal(x)
		@result = 0
		@count = 1

		@arr.push(cal(x))
	}

	puts @arr.max
end

require 'benchmark'
Benchmark.bmbm(50) do | x |
	x.report("Max size of Cycle-lenth for 1~ 100 : #{start(1,100)} => ") {start(1,100)}
end
