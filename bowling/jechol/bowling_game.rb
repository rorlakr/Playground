class BowlingGame
  def self.score(scores)
    round_scores = RoundScore.build(scores)
    return round_scores[0...12].inject(0) { |sum, cur| sum + cur.score_include_bonus }
  end
end

class RoundScore
  attr_accessor :first, :second, :frame, :next_round

  def self.build(scores)
    round_scores = scores.each_with_index.map { |s, i| RoundScore.new(s[0], s[1], i + 1) }
    round_scores.inject(nil) { |prev, cur| prev.next_round = cur if prev; cur }
    round_scores
  end

  def initialize(first, second, frame)
    self.first = first
    self.second = second
    self.frame = frame
  end

  def strike?; first == 10; end
  def spare?; first + second == 10; end
  def open?; !strike? and !spare; end
  def sum; first + second; end

  def score_include_bonus
    return sum if frame >= 10

    ret = sum

    if strike?
      if next_round
        ret += next_round.sum
        if next_round.strike? and next_round.next_round
          ret += next_round.next_round.first
        end
      end
    elsif spare?
      ret += next_round.first if next_round
    end

    ret
  end
end
