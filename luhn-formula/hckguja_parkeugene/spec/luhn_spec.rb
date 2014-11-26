require './app/luhn'
require 'spec_helper'

RSpec.describe Luhn, focus:true do
  describe "#g" do
    it "returns true for g(5)" do
      expect(Luhn.new.g(5)).to eq(9)
    end

    it "returns true for g(7992739871)" do
      expect(Luhn.new.g(7992739871)).to eq(3)
    end
  end

  describe "#v?" do
    it "returns true for valid(79927398713)" do
      expect(Luhn.new.v?(79927398713)).to be_truthy
    end
    it "returns false for valid(79927398711)" do
      expect(Luhn.new.v?(79927398711)).to be_falsy
    end
  end
end