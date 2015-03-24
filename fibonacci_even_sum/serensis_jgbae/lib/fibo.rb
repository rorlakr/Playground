class Fibo
  attr_accessor :limit, :even_sum, :array

  def initialize(limit)
    @limit = limit
    @array = Array.new
  end
  
  def even_sum()
  	bb=1
  	b=1
  	sum=0
  	
  	c=0
  	begin
  		c=bb+b
  		if(c < @limit && c%2 == 0)
  			@array << c
  			sum+=c
  		end
  		bb=b
  		b=c
  	end while c < @limit
 		sum
  end



end 
