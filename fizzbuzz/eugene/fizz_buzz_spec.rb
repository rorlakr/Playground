require './app/fizz_buzz'

RSpec.describe FizzBuzz do
  let(:fifteen) { FizzBuzz.new 15 }

  describe "#fizzbuzz" do
    it "returns fizz for fizz()" do
      expect(fifteen.fizz()).to eq([1, 2, "fizz", 4, 5, "fizz", 7, 8, "fizz", 10, 11, "fizz", 13, 14, "fizz"])
    end

    it "returns buzz for fizz_buzz()" do
      expect(fifteen.fizz_buzz()).to eq([1, 2, "fizz", 4, "buzz", "fizz", 7, 8, "fizz", "buzz", 11, "fizz", 13, 14, "fizzbuzz"])
    end

  end

end