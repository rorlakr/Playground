# require './spec/spec_helper'
require './fb.rb'

describe "FizzBuzz" do
  describe "version 1" do
    # it "torun" do
    #   expect(true).to eq false
    # end
    it "1" do
      expect(fizzbuzz(1)).to eq [1]
    end
    
    it "2" do
      expect(fizzbuzz(2)).to eq [1,2]
    end

    it "10" do
      expect(fizzbuzz(10)).to eq [1, 2, 'Fizz', 4, 'Buzz', 'Fizz', 7, 8, 'Fizz', 'Buzz']
    end

    it "15" do
      expect(fizzbuzz(15)).to eq [1, 2, 'Fizz', 4, 'Buzz', 'Fizz', 7, 8, 'Fizz', 'Buzz', 
      11, 'Fizz', 13, 14, 'FizzBuzz']
    end
  end
  
  describe "version 2" do
    # it "torun" do
    #   expect(true).to eq false
    # end
    it "1" do
      expect(fizbuz(1)).to eq [1]
    end
    
    it "2" do
      expect(fizbuz(2)).to eq [1,2]
    end

    it "10" do
      expect(fizbuz(10)).to eq [1, 2, 'Fizz', 4, 'Buzz', 'Fizz', 7, 8, 'Fizz', 'Buzz']
    end

    it "15" do
      expect(fizbuz(15)).to eq [1, 2, 'Fizz', 4, 'Buzz', 'Fizz', 7, 8, 'Fizz', 'Buzz', 
      11, 'Fizz', 13, 14, 'FizzBuzz']
    end
    
    it "fizzbuzz" do
      expect(check(15)).to eq 'FizzBuzz'
    end

    it "fizz" do
      expect(check(3)).to eq 'Fizz'
    end

    it "buzz" do
      expect(check(5)).to eq 'Buzz'
    end
    
  end

end