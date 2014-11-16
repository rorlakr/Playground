require 'benchmark'

class CycleLength
  attr_accessor :numbers

  def initialize(number)
    @number = number
    @numbers = [number]
  end

  def run
    if @number.odd?
      @number = three_plus_1(@number)
    else
      @number = mod2(@number)
    end
    @numbers << @number

    return nil if @number == 1

    run
  end

  def mod2(number)
    number / 2
  end

  def three_plus_1(number)
    3 * number + 1
  end

  def cycle_length
    @numbers.count
  end
end

class CycleLength2
  attr_accessor :numbers

  def initialize(number)
    @number = number
    @count = 1
  end

  def run
    if @number.odd?
      @number = three_plus_1(@number)
    else
      @number = mod2(@number)
    end
    @count += 1

    return nil if @number == 1

    run
  end

  def mod2(number)
    number / 2
  end

  def three_plus_1(number)
    3 * number + 1
  end

  def cycle_length
    @count
  end
end

class Diff
  def initialize(i, j)
    @numbers = (i..j).to_a
    @cycle_lengths = []

    @numbers.each do |number|
      cycle = CycleLength.new(number)
      cycle.run
      cycle_length = cycle.cycle_length
      @cycle_lengths << cycle_length
    end
  end

  def max
    @cycle_lengths.max
  end
end

class Diff2
  def initialize(i, j)
    @numbers = (i..j).to_a
    @cycle_lengths = []

    @numbers.each do |number|
      cycle = CycleLength2.new(number)
      cycle.run
      cycle_length = cycle.cycle_length
      @cycle_lengths << cycle_length
    end
  end

  def max
    @cycle_lengths.max
  end
end

Benchmark.bm do |x|
  x.report { 
    diff = Diff.new(1, 100000)
    puts "Max #1 #{diff.max}"
  }
  x.report { 
    diff = Diff2.new(1, 100000)
    puts "Max #2 #{diff.max}"
  }
end

