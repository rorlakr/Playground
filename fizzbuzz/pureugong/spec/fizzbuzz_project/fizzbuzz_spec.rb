require "./spec/spec_helper"

describe FizzbuzzProject::Fizzbuzz do
	it "Fizzbuzz Test" do
		expect(FizzbuzzProject::Fizzbuzz.new(5).go).to eq "12Fizz4Buzz"
		expect(FizzbuzzProject::Fizzbuzz.new(15).go).to eq "12Fizz4BuzzFizz78FizzBuzz11Fizz1314FizzBuzz"
	end
end