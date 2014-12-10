class Interval
  attr_accessor :min, :max

  def initialize(min, max)
    @min = min
    @max = max
  end

  def intersection(value)
    case
    when value > max
      max - min
    when value < min
      0
    else
      value - min
    end
  end

  def price(value, unit_price)
    intersection(value) * unit_price
  end
end 
