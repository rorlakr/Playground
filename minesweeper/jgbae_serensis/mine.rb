class Mineswpeer
  attr_accessor :m, :n, :board, :cnt
  
  def initialize(m, n)
    @m = m
    @n = n
    @board = Array.new(m){Array.new(n)}
    @cnt = m*n/5
    @cnt.times do
      t = rand(m*n)
      y=t/n
      x=t%m
      
      @board[x][y] = '*'
    end
    

  
      
    
  end
  
  def printMap
    @board.each do |m|
      p m
    end
    puts
  end
  
  
  
  
end

test = Mineswpeer.new(3,4)
p test.printMap

