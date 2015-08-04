class Calc
  # Implement here
  @value = 0
  @operator = nil
  
  def one 
    if @operator.nil?
      @value = 1
      self
    else
      @value.send @operator, 1
    end
  end
  def two
    if @operator.nil?
      @value = 2
      self
    else
      @value.send @operator, 2
    end
  end
  def three
    if @operator.nil?
      @value = 3
      self
    else
      @value.send @operator, 3
    end
  end
  def four
    if @operator.nil?
      @value = 4
      self
    else
      @value.send @operator, 4
    end
  end
  def five
    if @operator.nil?
      @value = 5
      self
    else
      @value.send @operator, 5
    end
  end
  def six
    if @operator.nil?
      @value = 6
      self
    else
      @value.send @operator, 6
    end
  end
  def seven
    if @operator.nil?
      @value = 7
      self
    else
      @value.send @operator, 7
    end
  end
  def eight
    if @operator.nil?
      @value = 8
      self
    else
      @value.send @operator, 8
    end
  end
  def nine
    if @operator.nil?
      @value = 9
      self
    else
      @value.send @operator, 9
    end
  end
  def zero
    if @operator.nil?
      @value = 0
      self
    else
      @value.send @operator, 0
    end
  end
  def plus
    @operator = :+
    self
  end
  def minus
    @operator = :-
    self
  end
  def times
    @operator = :*
    self
  end
  def divided_by
    @operator = :/
    self
  end
end
