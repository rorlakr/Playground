class OilDiscount
  def initialize(separators, prices)
    @separators = separators
    @prices = prices
  end

  def intervals
    @separators.each_cons(2).map do |minmax|
      Interval.new(*minmax)
    end
  end
  
  def price(quantity)
    intervals.map.with_index do |interval, i|
      interval.price(quantity, @prices[i])
    end.inject(:+)
  end
end
