require 'spec_helper'

describe OilDiscount do
  it "OilDiscount은 가격을 계산할 수 있다" do
    separators = [0, 20, 40, Float::INFINITY]
    prices = [0.9, 0.8, 0.75]
    oil_discounter = OilDiscount.new(separators, prices)

    expect(oil_discounter.price(1)).to eq(0.9)
    expect(oil_discounter.price(1.5)).to eq(1.35)
    expect(oil_discounter.price(2)).to eq(1.8)
    expect(oil_discounter.price(3)).to eq(2.70)
    expect(oil_discounter.price(20)).to eq(18.0)
    expect(oil_discounter.price(21)).to eq(18.8)
    expect(oil_discounter.price(22)).to eq(19.6)
    expect(oil_discounter.price(35)).to eq(30.0)
    expect(oil_discounter.price(42)).to eq(35.5)
    expect(oil_discounter.price(100)).to eq(79.0)
  end
end
