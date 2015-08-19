require 'calc'

RSpec.describe Calc do
  specify do
    expect(Calc.new.one.plus.two).to eq 3
  end
  specify do
    expect(Calc.new.five.minus.six).to eq -1
  end
  specify do
    expect(Calc.new.seven.time.two).to eq 14
  end
  specify do
    expect(Calc.new.nine.divide_by.three).to eq 3
  end
end
