require 'spec_helper'
require './lib/josephus'

describe "test" do
  it "test" do	
    expect(josephus(7,3)).to eq(4)
  end

  it "test2" do	
    expect(josephus(10,3)).to eq(4)
  end

  it "test2" do	
    expect(josephus(5,2)).to eq(3)
  end

  it "test2" do	
    expect(josephus(5,2)).to eq(3)
  end

  it "test2" do	
    expect(josephus(66,100)).to eq(7)
  end

  it "test2" do	
    expect(josephus(1000,1000)).to eq(609)
  end
end
