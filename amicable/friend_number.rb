
class FriendNumber
  attr_accessor :loop_number
  @loop_number = 1
  def initialize
   @loop_number = 10000
  end

  def real_aliquot(candidate_friend_number)
    array_aliquot = []
    candidate_friend_number.times do |k|
        if candidate_friend_number % (k+1) == 0 && candidate_friend_number != k+1
            array_aliquot.push(k+1)
        end
    end
    array_aliquot
  end
end


friend_number = []
friend_number_instance = FriendNumber.new
friend_number_instance.loop_number.times do |candidate_friend_number|
  target_number = candidate_friend_number + 1
  real_aliquot_list = friend_number_instance.real_aliquot(target_number)
  sum_aliquot_value = real_aliquot_list.inject(:+)
  if sum_aliquot_value != nil && target_number != sum_aliquot_value && (target_number == friend_number_instance.real_aliquot(sum_aliquot_value).inject(:+))
    if target_number > sum_aliquot_value
      friend_number.push([sum_aliquot_value, target_number]) unless friend_number.include?([sum_aliquot_value, target_number])
    else
      friend_number.push([target_number, sum_aliquot_value]) unless friend_number.include?([target_number, sum_aliquot_value])
    end



  end
end
p friend_number.to_s
