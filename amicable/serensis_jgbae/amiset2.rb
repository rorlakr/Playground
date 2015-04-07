require 'benchmark'
class Ami
	@@ami_hash = Hash.new
	@@array = Array.new
	# 진약수 합 계산 
	def f(a)
		x = a/2
  	b = (1..x).select {|n| a%n == 0}.inject(:+)
  	@@array[a] = b
  	return b
  end

	# 친화수 해쉬 셋 구하기
  def f_set(n)
    x = 2
  	while (n > x)
  		 f(x)
  		 x+=1
  	end
  	x = 2
  	while (n > x)
  		if(x == @@array[@@array[x]] && x < @@array[x])
  		 @@ami_hash[x] = @@array[x] 
  		end
  		x +=1
  	end
  	@@ami_hash
  end
end

# 벤치마크
Benchmark.bm do |x|
  x.report { 
  	t = Ami.new
    ret = t.f_set(10000)
    puts "1~10000 친화수 : #{ret}"
  }
end

