class RankBetter

  def ranks(scores)
    arr = scores.sort.reverse
    scores.map { |v| arr.index(v) + 1 }
  end
  
end
