class Don 

  NUMBER_PAIR= {
	one: 1, 
	two: 2, 
	three: 3,
	four: 4,
	five: 5,
	six: 6,
	seven: 7,
	eight: 8,
	nine: 9, 
	zero: 10

  }  

  def parse(str) 
    l, o, r = str.split('.')[2..-1]
    lv = str_to_number(l)
    rv = str_to_number(r)

    case o
    when 'plus' then lv + rv
    when 'minus' then lv - rv
    when 'times' then lv * rv
    when 'divided_by' then lv / rv
    end
  end

  def str_to_number(str)
  	NUMBER_PAIR[str.to_sym]
  end

end