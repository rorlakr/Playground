class Rank

  def ranks(scores)
    hash = {}
    scores.each do |score|
      if hash[score].nil?
        hash[score] = 1
      else
        hash[score] += 1
      end
    end
    
    results = []
    ranks = hash.sort.reverse
    scores.map do |score|
      ranks.each_with_index do |arr, index|
        if score == arr[0]
          unless index == 0
            prev = ranks[0..(index-1)].inject(0) { |total, rank| total += rank[1] }
          end
          results << 1 + (prev || 0)
        end
      end
    end
    results
  end
  
end
