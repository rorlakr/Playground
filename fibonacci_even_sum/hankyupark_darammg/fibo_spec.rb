require "minitest/autorun"
require "./fibonacci.rb"


describe CalcEvenFibo do 
  before do
    @fibo = CalcEvenFibo.new
  end

  describe "get_even_sum_test" do
    it "upper_limit_400000" do
      @fibo.get_even_sum?(400000).must_equal 257114
    end
  end  

end
