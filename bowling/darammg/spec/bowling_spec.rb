#encoding utf-8
require './app/bowling'

RSpec.describe Bowling do
  describe "bowling score for frame" do
    
    it "input [10] for total_score : 0" do #1프레임
      expect(Bowling.new.start_scoring([10])).to eq(0)
    end
    
    it "input [10,10] for total_score : 0" do #2프레임
      expect(Bowling.new.start_scoring([10,10])).to eq(0)
    end
    
    it "input [10,10,10] for total_score : 30" do #3프레임
      expect(Bowling.new.start_scoring([10,10,10])).to eq(30)
    end
    
    it "input [10,10,10,8,2] for total_score : 78" do #4프레임
      expect(Bowling.new.start_scoring([10,10,10,8,2])).to eq(78)
    end
    
    it "input [10,10,10,8,2,7,3] for total_score : 95" do #5프레임
      expect(Bowling.new.start_scoring([10,10,10,8,2,7,3])).to eq(95)
    end
    
    it "input [10,10,10,8,2,7,3,9,1] for total_score : 114" do #6프레임
      expect(Bowling.new.start_scoring([10,10,10,8,2,7,3,9,1])).to eq(114)
    end
    
    it "input [10,10,10,8,2,7,3,9,1,7,2] for total_score : 140" do #7프레임
      expect(Bowling.new.start_scoring([10,10,10,8,2,7,3,9,1,7,2])).to eq(140)
    end
    
    it "input [10,10,10,8,2,7,3,9,1,7,2,3,0] for total_score : 143" do #8프레임
      expect(Bowling.new.start_scoring([10,10,10,8,2,7,3,9,1,7,2,3,0])).to eq(143)
    end
    
    it "input [10,10,10,8,2,7,3,9,1,7,2,3,0,7,2] for total_score : 152" do #9프레임
      expect(Bowling.new.start_scoring([10,10,10,8,2,7,3,9,1,7,2,3,0,7,2])).to eq(152)
    end
    
    it "input [10,10,10,8,2,7,3,9,1,7,2,3,0,7,2,6,3,0] for total_score : 161" do #10프레임
      expect(Bowling.new.start_scoring([10,10,10,8,2,7,3,9,1,7,2,3,0,7,2,6,3,0])).to eq(161)
    end
    
  end
end
