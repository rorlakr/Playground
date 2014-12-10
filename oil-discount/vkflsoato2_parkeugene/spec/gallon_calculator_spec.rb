require './app/gallon_calculator'
require 'spec_helper'

RSpec.describe GallonCalculator, focus:true do
  describe "#cal" do
    it "returns true for cal(1)" do
      expect(GallonCalculator.new(1).cal).to eq(0.9)
    end

    it "returns true for cal(35)" do
      expect(GallonCalculator.new(35).cal).to eq(30)
    end

    it "returns true for cal(100)" do
      expect(GallonCalculator.new(100).cal).to eq(79)
    end
  end
end