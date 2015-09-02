class User
  LEVELS = [-8, -7, -6, -5, -4, -3, -2, -1, 1, 2, 3, 4, 5, 6, 7, 8]

  attr_accessor :current_rank_index, :current_progress

  def initialize(options={})
    if options[:starting_level]
      @current_rank_index = LEVELS.index(options[:starting_level])
    else
      @current_rank_index = 0
    end
    @current_progress = 0
  end

  def rank
    LEVELS[@current_rank_index]
  end

  def progress
    @current_progress
  end

  def inc_progress(monster_rank)

    if @current_rank_index >= LEVELS.size - 1
      @current_pregress = 0
      return
    end

    diff = LEVELS.index(rank) - LEVELS.index(monster_rank)
    case diff
    when 0
      @current_progress += 3
    when 1
      @current_progress += 1
    when -(LEVELS.size - 1)..-1
      @current_progress += (10 * diff * diff)
    end

    level_up
  end

  def level_up
    if @current_progress >= 100 && @current_rank_index < (LEVELS.size - 1)
      @current_rank_index += (@current_progress / 100)
      @current_progress %= 100

      # Ranking overflow
      if @current_rank_index >= LEVELS.size
        @current_rank_index = LEVELS.size - 1
        @current_progress = 0
      end
    end
  end
end

