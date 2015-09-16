def luck_check(str)
	fail 'Non number' unless str =~ /^\d+$/
	values = split(str)
	x = values.map do |v|
		v.each_char.map(&:to_i).reduce(:+)
	end
	x[0] == x[1]
end

def split(str)
	result = (str.length+1)/2
	[str[0...result], str[-result..-1]]
end
