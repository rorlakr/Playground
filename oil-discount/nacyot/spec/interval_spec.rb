require 'spec_helper'

describe Interval do
  before(:each) do
    @interval = Interval.new(20, 40)    
  end
  
  it "Interval은 min, max를 가진다" do
    expect(@interval.min).to eq(20)
    expect(@interval.max).to eq(40)
  end

  it "Interval은 구간에 포함되는 범위를 계산할 수 있다" do
    expect(@interval.intersection(100)).to eq(20)
    expect(@interval.intersection(100)).not_to eq(25)
  end

  it "Interval은 무한 구간에 대하서 intersection을 계산할 수 있다." do
    interval = Interval.new(20, Float::INFINITY)

    expect(interval.intersection(100)).to eq(80)
  end
end

