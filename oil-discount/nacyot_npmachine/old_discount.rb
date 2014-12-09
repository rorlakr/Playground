class OldDiscount
  def initialize(gallon)
    @gallon = gallon
  end

  def price
    t, s, f = 0, 0, 0
    
    if @gallon > 40
      t = (@gallon - 40) * 0.75
      @gallon = 40
    end

    if @gallon > 20
      s = (@gallon - 20) * 0.8
      @gallon = 20
    end

    if @gallon > 0
      f = @gallon * 0.9
    end

    t + s + f

    first_interval = interval(0, 20)
  end

  def inteval(min, max)
    @gallon > min ? @gallon - min : 0
  end
end
