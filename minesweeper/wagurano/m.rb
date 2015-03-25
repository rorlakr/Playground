
class Mineswpeer
  attr_accessor :m, :n
  @board = nil
  def initialize(m, n)
    @m = m
    @n = n
    @board = Array.new(m){ Array.new(n) { ([0]*7+['*']).sample } }
    puts "show @board"
    show @board
    puts
  end
  
  def calculate
    
    @pad_hint = @board
    @pad_hint.map! { |r| r.unshift(0); r.push(0) }
    @pad_hint.unshift Array.new(n+2) { 0 }
    @pad_hint.push Array.new(n+2) { 0 }
    
    (1..@m).each do |i|
      (1..@n).each do |j|
        if @pad_hint[i][j] == "*"
          @pad_hint[i][j] = -10 
        end
      end
    end
    
    (1..@m).each do |i|
      (1..@n).each do |j|
        if @pad_hint[i][j] < 0
          @pad_hint[i-1][j-1] += 1; @pad_hint[i-1][j] += 1; @pad_hint[i-1][j+1] += 1;
          @pad_hint[i][j-1] += 1; @pad_hint[i][j+1] += 1;
          @pad_hint[i+1][j-1] += 1; @pad_hint[i+1][j] += 1; @pad_hint[i+1][j+1] += 1;
        end
      end
    end
    
    (1..@m).each do |i|
      (1..@n).each do |j|
        print (@pad_hint[i][j] < 0 ? "*" : @pad_hint[i][j]), " "
      end
      puts
    end
  end
  
  def show arr
    arr.map { |r| r.map { |c| print c , " "}; puts }
  end
  
  def find_mine
  end
end

puts "init minesweeper"
m = Mineswpeer.new(15, 15)
puts "calculate"
m.calculate
