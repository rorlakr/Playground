###########
## Usage ##
#
# puts Scoreboard.score([[10,0],[10,0],[10,0],[8,2],[7,3],[9,1],[7,2],[3,0],[7,2],[6,3,0]])
# puts Scoreboard.score([[10,0],[10,0],[10,0],[8,2],[7,3],[9,1],[7,2],[3,0],[7,2],[6,0],[3,0],[0,0]])
# puts Scoreboard.score([10,10,10,8,2,7,3,9,1,7,2,3,0,7,2,6,3,0])
#
###########

class Scoreboard
  def self.score(input)
    tries = self.normalize(input)

    total_score = 0
    index = 0

    begin
      (1..10).each do |frame_number|
        tmp_score = tries[index] + tries[index+1]
        total_score += tmp_score

        if tries[index] == 10 # strike
          total_score += tries[index+2]
          index += 1
        elsif tmp_score == 10 # spare
          total_score += tries[index+2]
          index += 2
        else # open
          index += 2
        end
      end
    rescue e
      puts e
      puts "Error: input is invalid"
    end

    total_score
  end

  private

  def self.normalize(tries)
    return tries unless tries.first.class == Array
    if tries.size == 12
      tries[9].pop
      tries[10].pop
      tries[11].pop
    end

    tries.map! do |el|
      el.pop if el.size == 2 and el & [10,0] == [10,0]
      el
    end

    tries.flatten
  end
end