# 2.

# 문장으로 풀어서 계산`
#    Calc.new.one.plus.two             # Should return 3
#    Calc.new.five.minus.six           # Should return -1
#    Calc.new.seven.times.two          # Should return 14
#    Calc.new.nine.divided_by.three     # Should return 3
# ````
# 
# 사칙 연산(plus, minus, times, divided_by)과 0부터 9까지 숫자(zero, one, two, three, four, five, six, seven, eight, nine)만 사용합니다.연산은 한 번만 계산합니다. 

require 'spec_helper'
require './dondon'

describe "Dondon" do
  describe "problem test" do
    let(:don){Don.new}

    	it "test" do
			expect(don.parse("Calc.new.one.plus.two")).to eq(3)
			expect(don.parse("Calc.new.three.minus.two")).to eq(1)
			expect(don.parse("Calc.new.one.times.two")).to eq(2)
			expect(don.parse("Calc.new.nine.divided_by.three")).to eq(3)
    	end

    	it 'number_str to value' do 
    		expect(don.str_to_number('one')).to eq(1)
    		expect(don.str_to_number('two')).to eq(2)
    		expect(don.str_to_number('three')).to eq(3)
    	end


	end

end