class FizzBuzz 

  def fizz i
     if (i % 3).zero? and (i % 5).zero?
       "FizzBuzz"
     elsif (i % 5).zero?
      "Buzz" 
     elsif(i % 3).zero?
      "Fizz" 
     else 
      "foo"
     end 
  end

  def loop_n n
    (1..n).each do |i|
      puts "#{i} #{fizz(i)}"
    end
  end


end 

F = FizzBuzz.new
F.loop_n(100)