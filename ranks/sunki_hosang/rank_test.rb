require 'minitest/autorun'
require './rank'
require './rank_better'

class RankTest < Minitest::Test
  def setup
    @rank = Rank.new
    @rank_better = RankBetter.new
  end

  def ranks(scores)
    @rank.ranks(scores)
  end

  def ranks_better(scores)
    @rank_better.ranks(scores)
  end
  
  def test_ranks
    assert_equal [2,4,3,1], ranks([9,3,6,10])
    assert_equal [2,2,2,2,2,1,7], ranks([3,3,3,3,3,5,1])
  end
  
  def test_ranks_better
    assert_equal [2,4,3,1], ranks_better([9,3,6,10])
    assert_equal [2,2,2,2,2,1,7], ranks_better([3,3,3,3,3,5,1])
  end
end


