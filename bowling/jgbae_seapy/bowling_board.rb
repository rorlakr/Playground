class BowlingBoard
  attr_accessor :frames, :scores

  def initialize(scores)
    @scores = scores
    @frames = []
    calc()
  end

  def calc
    frame_index = 0
    is_open = false

    @scores.each_with_index do |score, index|
      score1 = @scores[index+1] || 0
      score2 = @scores[index+2] || 0

      if score == 10 # strike
        @frames[frame_index] = score + score1 + score2
        frame_index += 1
      elsif !is_open
        @frames[frame_index] = score
        is_open = true
      else
        new_score = @frames[frame_index] + score
        @frames[frame_index] = new_score + (new_score == 10 ? score1 : 0)
        frame_index += 1
        is_open = false
      end
    end
  end

  def sum
    @frames.reduce(&:+)
  end
end

bowling_board = BowlingBoard.new([10,10,10,8,2,7,3,9,1,7,2,3,0,7,2,6,3,0])
p bowling_board.frames
p bowling_board.sum
