class User
  LEVELS = [-8, -7, -6, -5, -4, -3, -2, -1, 1, 2, 3, 4, 5, 6, 7, 8]

  attr_reader :progress

  def initialize(starting_level: LEVELS[0])
    @rank_index = LEVELS.index(starting_level)
    @progress = 0
  end

  def rank
    LEVELS[rank_index]
  end

  def inc_progress(monster_rank)
    if rank_index >= LEVELS.size - 1
      progress = 0
      return
    end

    diff = LEVELS.index(rank) - LEVELS.index(monster_rank)

    case diff
    when 0
      self.progress += 3
    when 1
      self.progress += 1
    when -(LEVELS.size - 1)..-1
      self.progress += (10 * diff * diff)
    end

    level_up
  end

  private

  attr_accessor :rank_index
  attr_writer :progress

  def level_up
    if progress >= 100 && rank_index < (LEVELS.size - 1)
      self.rank_index += (progress / 100)
      self.progress %= 100

      # Ranking overflow
      if rank_index >= LEVELS.size
        rank_index = LEVELS.size - 1
        progress = 0
      end
    end
  end
end
