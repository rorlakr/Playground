require "./spec/spec_helper"

describe FizzbuzzProject::Fizzbuzz do
	it "Fizzbuzz Test" do
		expect(FizzbuzzProject::Fizzbuzz.new(5).go).to eq "1 2 Fizz 4 Buzz"
		expect(FizzbuzzProject::Fizzbuzz.new(15).go).to eq "1 2 Fizz 4 Buzz Fizz 7 8 Fizz Buzz 11 Fizz 13 14 FizzBuzz"
	end
end