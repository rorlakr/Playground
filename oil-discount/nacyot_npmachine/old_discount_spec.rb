require "./old_discount.rb"

describe OldDiscount do
  before do
    
  end
  
  it "1 갤론은 90센트다." do
    expect(OldDiscount.new(1).price).to be_equal(0.90)
    expect(OldDiscount.new(2).price).to be_equal(1.80)
    expect(OldDiscount.new(3).price).to be_equal(2.70)
    expect(OldDiscount.new(20).price).to be_equal(18.0)
    expect(OldDiscount.new(21).price).to be_equal(18.8)
    expect(OldDiscount.new(22).price).to be_equal(19.6)
    expect(OldDiscount.new(42).price).to be_equal(0.9*20+0.8*20+0.75*2)
  end
end
