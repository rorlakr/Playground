class User
  attr_accessor :rank, :progress

  def initialize
    @rank = -8
    @progress = 0
  end

  def inc_progress(monster_level)
    return if @rank == 8
    monster_level -= 1 if @rank < 0 && monster_level > 0
    level = (@rank - monster_level).abs
    
    if level == 0
      @progress += 3
    elsif level == 1 && @rank > monster_level
      @progress += 1
    elsif level > 1 && @rank > monster_level
      @progress == 0
      return
    else
      @progress += 10 * level * level
    end  

    level_up = @progress / 100
    @progress -= level_up * 100
    level_up += 1 if @rank < 0 && (@rank + level_up) >= 0
    @rank += level_up
  end
end
