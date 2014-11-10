require './app/self_number'

RSpec.describe SelfNumber do
  describe "#d" do
    it "returns 4 for d(2)" do
      expect(SelfNumber.d(2)).to eq(4)
    end

    it "returns 101 for d(100)" do
      expect(SelfNumber.d(100)).to eq(101)
    end

    it "returns 4997 for d(4969)" do
      expect(SelfNumber.d(4969)).to eq(4997)
    end
  end
end