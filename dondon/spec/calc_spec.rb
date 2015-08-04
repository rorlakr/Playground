# 2.

# 문장으로 풀어서 계산`
#    Calc.new.one.plus.two             # Should return 3
#    Calc.new.five.minus.six           # Should return -1
#    Calc.new.seven.times.two          # Should return 14
#    Calc.new.nine.divided_by.three     # Should return 3
# ````
# 
# 사칙 연산(plus, minus, times, divided_by)과 0부터 9까지 숫자(zero, one, two, three, four, five, six, seven, eight, nine)만 사용합니다.연산은 한 번만 계산합니다. 
  
  NUMBER_PAIR= {
   
    one: 1, 
    two: 2, 
    three: 3,
    four: 4,
    five: 5,
    six: 6,
    seven: 7,
    eight: 8,
    nine: 9, 
    zero: 10
  }  


class Calc


    NUMBER_PAIR.each do |method, value|
 
        define_method method do 
            Operator.new(value)
        end
    end

end

class Operator
    def initialize(value)
        @value = value
    end

    [[:plus, :+], [:minus, :-], [:divided_by, :/], [:times, :*]].each do |method, op|

        define_method method do
            Result.new(@value, op)
        end
    end
end

class Result
    def initialize(lvalue, op)
        @lvalue = lvalue
        @op = op
    end

    NUMBER_PAIR.each do |method, value|

        define_method method do 
            eval("#{@lvalue}#{@op}#{value}")
        end
    end
end


require 'spec_helper'

describe "Calc" do
  describe "problem test" do
    let(:don){Don.new}

    	it "test" do
			expect(Calc.new.one.plus.two).to eq(3)
			expect(Calc.new.three.plus.two).to eq(5)
            expect(Calc.new.three.minus.two).to eq(1)            
			expect(Calc.new.one.times.two).to eq(2)
            expect(Calc.new.one.times.three).to eq(3)
			expect(Calc.new.nine.divided_by.three).to eq(3)
            expect(Calc.new.one.times.nine).to eq(9)
            expect(Calc.new.one.times.eight).to eq(8)
            expect(Calc.new.nine.divided_by.one).to eq(9)
    	end
	end
end


