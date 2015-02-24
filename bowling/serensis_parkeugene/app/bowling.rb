# 조희영 serensis@gmail.com, 박유진 parkeugene7676@gmail.com

class Bowling

  @@record = {
            "1"=>[nil,0,0],
            "2"=>[nil,0,0],
            "3"=>[nil,0,0],
            "4"=>[nil,0,0],
            "5"=>[nil,0,0],
            "6"=>[nil,0,0],
            "7"=>[nil,0,0],
            "8"=>[nil,0,0],
            "9"=>[nil,0,0],
            "10"=>[nil,0,0]
           }

  pin = 10
  bonus_round = 2

  def hit(f,n)

    if @@record[f][0].nil?
      return @@record[f][0] ||= n

      bf = f.to_i-1

      if @@record[bf.to_s][0..1].inject(:+) == 10
        @@record[bf.to_s][2] += @@record[f][0]
      end

      if @@record[(bf-1).to_s][0] == 10 # strike?
        if @@record[bf.to_s][0] == 10
          @@record[(bf-1).to_s][2] += @@record[bf][0]
        else
          @@record[(bf-1).to_s][2] += @@record[bf][0..1].inject(:+)
        end
      else
        if @@record[bf.to_s][0] == 10
          @@record[(bf-1).to_s][2] += @@record[bf][0]
        else
          @@record[(bf-1).to_s][2] += @@record[bf][0..1].inject(:+)
        end
       end
    else
      return @@record[f][1] = n
    end


  end

  def spare?

  end

  def strike?

  end

  def sum(f)
    rsum = 0
    lastframe = f.to_i
    (1..lastframe).each do |i|
     rsum += @@record[i.to_s].inject(:+)
    end
    return rsum
  end


end

class Frame
  attr_accessor :pin
  def initialize(pin)
    @pin = 10
  end
end

class Spare

end