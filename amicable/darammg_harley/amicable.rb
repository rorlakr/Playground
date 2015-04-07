class Amicable
  @@loop_number = 10000
  
  def self.loop_number
    @@loop_number
  end
  
  def self.real_aliquot(candidate_friend_number)
    array_aliquot = []
    candidate_friend_number.times do |k|
        if candidate_friend_number % (k+1) == 0 && candidate_friend_number != k+1
            array_aliquot.push(k+1)
        end
    end
    array_aliquot
  end
  
  def self.sum_array(target_array)
    target_array.inject(:+)
  end
  
  def self.get_amicable
    amicables = []
    loop_number.times do |number|
      target = number + 1
      target_array = real_aliquot(target)
      if target_array != []
        pair = sum_array(target_array)
        pair_array = real_aliquot(pair)
        pair_sum = sum_array(pair_array)
        
        if pair != nil && target != pair && target == pair_sum
          sort_friend_number = [target, pair].sort
          amicables.push(sort_friend_number) unless amicables.include?(sort_friend_number)
        end
      end
    end
    amicables
  end
end

p Amicable.get_amicable.to_s
