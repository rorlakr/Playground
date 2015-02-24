require './app/bowling'
require 'spec_helper'

RSpec.describe Bowling do
  describe "#hit" do
    it "returns 4 for hit('1',4)" , focus:true do
      expect(Bowling.new.hit('1',4)).to eq(4)
    end
    it "returns 5 for hit('1',5)" , focus:true do
      expect(Bowling.new.hit('1',5)).to eq(5)
    end
    it "returns 9 for sum('1')" , focus:true do
      expect(Bowling.new.sum('1')).to eq(9)
    end
    it "returns 9 for hit('2',9)" , focus:true do
      expect(Bowling.new.hit('2',9)).to eq(9)
    end
    it "returns 1 for hit('2',1)" , focus:true do
      expect(Bowling.new.hit('2',1)).to eq(1)
    end
    it "returns 9 for sum('2')" , focus:true do
      expect(Bowling.new.sum('2')).to eq(19)
    end
    it "returns 10 for hit('3',10)" , focus:true do
      expect(Bowling.new.hit('3',10)).to eq(10)
    end
    it "returns 29 for sum('3')" , focus:true do
      expect(Bowling.new.sum('3')).to eq(29)
    end

    it "returns 10 for hit('4',10)" , focus:true do
      expect(Bowling.new.hit('4',10)).to eq(10)
    end
    it "returns 49 for sum('4')" , focus:true do
      expect(Bowling.new.sum('4')).to eq(49)
    end
    # it "returns 10 for hit('5',)" , focus:true do
    #   expect(Bowling.new.hit('4',10)).to eq(10)
    # end
    # it "returns 39 for sum('5')" , focus:true do
    #   expect(Bowling.new.sum('4')).to eq(39)
    # end

  end

end