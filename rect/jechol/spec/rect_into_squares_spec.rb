require 'rect_into_squares'

RSpec.describe do
  specify do
    expect(rect_into_squares(5, 3)).to eq [3, 2, 1, 1]
  end

  specify do
    expect(rect_into_squares(3, 5)).to eq [3, 2, 1, 1]
  end

  specify do
    expect(rect_into_squares(5, 5)).to eq nil
  end
end


