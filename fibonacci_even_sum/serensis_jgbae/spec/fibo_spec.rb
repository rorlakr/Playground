require 'spec_helper'

describe Fibo do
  before(:each) do
    @fibo = Fibo.new(400000)
    @fibo2 = Fibo.new(10)   
    @fibo3 = Fibo.new(90)
  end
  
  it "Fibo는 최대값 limit 를 가진다." do
    expect(@fibo.limit).to eq(400000)
  end

  it "limit = 10 이라면 even_sum = 10" do
  	expect(@fibo2.limit).to eq(10)
  	expect(@fibo2.even_sum()).to eq(10)
  end
  
  it "limit=400000 이라면 even_sum = 257114" do
  	expect(@fibo.even_sum()).to eq(257114)
  end
  
  it "limit=90 이라면 even_sum = 44" do
  	sum = @fibo3.even_sum()
  	expect(@fibo3.limit).to eq(90)  
  	expect(@fibo3.array).to match_array([2,8,34])
  	expect(sum).to eq(44)
 	end
end

