class Frame
  attr_accessor :ball_count, :next, :max_size

  def initialize
    @ball_count = []
    @next = nil
    @max_size = 2
  end

  def is_full?
    strike? or spare? or (open? and size == @max_size)
  end

  def record(count)
    @ball_count << count
    true
  end

  def size
    @ball_count.size
  end

  def score
    return 0 unless is_full? and bonus_score_enabled?

    if strike? or spare?
      return sum_of_record(3)
    else
      return raw_score
    end
  end

  def bonus_score_enabled?
    return true if raw_score < 10
    
    if strike? or spare?
      return has_record?(3)
    else
      return true
    end
  end

  def has_record?(count)
    if size >= count
      return true
    elsif @next
      return @next.has_record?(count - size)
    else
      return false
    end
  end

  def sum_of_record(count)
    if size >= count
      return @ball_count[0...count].reduce(:+)
    elsif @next
      return @next.sum_of_record(count - size) + raw_score
    end
  end

  def raw_score
    return 10 if strike? or spare?
    return @ball_count.reduce(:+)
  end

  def strike?
    @ball_count.first == 10
  end

  def spare?
    size == @max_size and @ball_count.first + @ball_count[1] == 10
  end

  def open?
    !(strike? or spare?)
  end
end

class FinalFrame < Frame
  def initialize
    super
    @max_size = 3
  end

  def is_full?
    return true if (strike? or spare?) and size == @max_size
    return true if open? and size == @max_size - 1
    return false
  end
end

class Scoreboard
  attr_reader :frames, :last_frame_num

  def initialize
    @frames = [Frame.new]
    @last_frame_num = 10
  end

  def now_frame
    @frames.size
  end

  def score
    @frames.inject(0) { |sum, frame| sum + frame.score }
  end

  def throw_ball(count)
    return false if now_frame > @last_frame_num

    @frames.last.record(count)

    if @frames.last.is_full?
      frame = (now_frame == @last_frame_num - 1 ? FinalFrame.new : Frame.new)
      @frames.last.next = frame
      @frames << frame
    end

    true
  end

  def throw_balls(arr)
    arr.each { |count| throw_ball(count) }
  end
end