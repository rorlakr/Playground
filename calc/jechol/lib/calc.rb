class Fixnum
  alias_method :plus, :+
  alias_method :minus, :-
  alias_method :time, :*
  alias_method :divide_by, :/
end

class Calc
  attr_accessor :operand_1, :operator, :operand_2

  DIGITS = [:zero, :one, :two, :three, :four,
    :five, :six, :seven, :eight, :nine]

  OPERATORS = [:plus, :minus, :time, :divide_by]

  DIGITS.each do |digit|
    define_method digit do
      if operator == nil
        self.operand_1 = DIGITS.index(digit)
        self
      else
        self.operand_2 = DIGITS.index(digit)
        operand_1.send(operator, operand_2)
      end
    end
  end

  def method_missing(method, *args, &block)
    if OPERATORS.include? method
      self.operator = method
      self
    else
      super
    end
  end
end
