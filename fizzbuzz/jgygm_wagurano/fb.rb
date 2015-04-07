
def fizzbuzz n
  ret = []
  # (1..n).to_a
  (1..n).each do |x|
    if x % 15 == 0
      ret << 'FizzBuzz'
    elsif x % 3 == 0
      ret << 'Fizz'
    elsif x % 5 == 0
      ret << 'Buzz'
    else x
      ret << x
    end
  end
  puts ret.inspect
  ret
end

def check x
  if x % 15 == 0
    'FizzBuzz'
  elsif x % 3 == 0
    'Fizz'
  elsif x % 5 == 0
    'Buzz'
  else
    x
  end
end

def fizbuz n
  (1..n).map{ |x| check x }
  # (1..n).map{ |x| 'FizzBuzz' if x % 15 == 0; 'Fizz' if x % 3 == 0; 'Buzz' if x % 5 == 0; x }
  # (1..n).map{ |x| x % 3 + x % 5 }
  # (1..n).map{ |x| ['FizzBuzz', 'Fizz', 'Buzz'].select{ |w| x % 3 == 0 } }
  # (1..n).map{ |x| if x % 15 == 0; 'FizzBuzz'; else x end }.map{ |x| if x % 3 == 0; 'Fizz'; else x end }.map{ |x| if x % 5 == 0; 'Buzz'; else x end }
  (1..n).map{ |x| x % 15 == 0  ? 'FizzBuzz' : x }.map{ |x| x % 3 == 0 ? 'Fizz' : x }.map{ |x| x % 5 == 0 ? 'Buzz' : x }
end

puts (fizbuz 1000000).inspect
# puts (fizzbuzz 100000).inspect
