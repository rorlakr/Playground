require 'benchmark'
class Ami
	@@ami_hash = Hash.new
	
	# 진약수 합 계산 
	def f(a)
		x = a/2		# 진약수는 자기 자신을 제외한 약수들 이므로 절반의 약수만 구하면 됨
  	b = (1..x).select {|n| a%n == 0}.inject(:+)
  	return b
  end

	# 친화수 해쉬 셋 구하기
  def f_set(n)
  	(2..n).each do |i|
  		b = f(i)
			if(b>i && f(b)==i)
				@@ami_hash[i] = b
			end
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
