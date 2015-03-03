require './app/amicable_number'
require 'spec_helper'

RSpec.describe AmicableNumber, focus:true do


  describe "#factors_of 18" do
    it "returns [[1,18],[2,9],[3,6],[6,3],[9,2],[18,1]] for factors_of(18)" do
      expect(AmicableNumber.factors_of(18)).to eq([[1,18],[2,9],[3,6],[6,3],[9,2],[18,1]])
    end
  end

  describe "#factors_of 220" do
    it "returns [[1, 220], [2, 110], [4, 55], [5, 44], [10, 22], [11, 20], [20, 11], [22, 10], [44, 5], [55, 4], [110, 2], [220, 1]] for factors_of(220)" do
      expect(AmicableNumber.factors_of(220)).to eq([[1, 220], [2, 110], [4, 55], [5, 44], [10, 22], [11, 20], [20, 11], [22, 10], [44, 5], [55, 4], [110, 2], [220, 1]])
    end
  end

  describe "#sum" do
    it "returns 284 for sum(220)" do
      expect(AmicableNumber.sum(220)).to eq(284)
    end
  end

  describe "#amicable?" do
    it "returns true for amicable?(220,284)" do
      expect(AmicableNumber.amicable?(220,284)).to be_truthy
    end
  end

end