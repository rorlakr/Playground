class Pointer
  attr_reader :i, :x, :y
  attr_accessor :visited

  NEXT_DIRECTION = {
    right: :down,
    down: :left,
    left: :up,
    up: :right
  }
  
  def initialize(i, n)
    @i = i
    @x = (i - 1) % n
    @y = (i - 1) / n
    @visited = false
  end

  def next_pointer
    return nil if self.nil?
    self.visited = true
    pointer = move
      
    if pointer.nil? || pointer.visited
      self.class.turn
      pointer = move
      if pointer.nil? || pointer.visited
        pointer = nil
      end
    end  

    pointer
  end
  
  private
  
  def move
    case self.class.current_direction
    when :right then self.class.find_by_xy(x + 1, y) 
    when :down  then self.class.find_by_xy(x, y + 1) 
    when :left  then self.class.find_by_xy(x - 1, y) 
    when :up    then self.class.find_by_xy(x, y - 1) 
    end
  end
  
  module ClassMethods
    def generate(n)
      @direction = :right
      @pointers = (1..n**2).map { |i| Pointer.new(i, n) }
    end
    
    def find_by_xy(x, y)
      @pointers.find { |pointer| pointer.x == x && pointer.y == y }
    end
    
    def current_direction
      @direction
    end
    
    def turn
      @direction = NEXT_DIRECTION[@direction]
    end
  end
  extend ClassMethods
end


def snail1(n)
  puts "n: #{n}"
  current = Pointer.generate(n).first
  while current
    p current
    current = current.next_pointer
  end
end

class StringPointer < Pointer
  
  def initialize(i, str, n)
    @i = str
    @x = i % n
    @y = i / n
    @visited = false
  end
  
  def self.generate(s, e)
    @direction = :right
    strs = (s..e).to_a # [*s..e] 스프레드 연산자 스를렛 오퍼레이터
    n = (strs.size ** 0.5).to_i
    @pointers = strs.each_with_index.map { |str, i| StringPointer.new(i, str, n) }
  end
  
  def self.generated_by_array(array)
    @direction = :right
    strs = array.flatten
    n = (strs.size ** 0.5).to_i
    @pointers = strs.each_with_index.map { |str, i| StringPointer.new(i, str, n) }
  end
end

def snail2(s, e)
  current = StringPointer.generate(s, e).first
  while current
    p current
    current = current.next_pointer
  end
end
# "a".."z"
# n?
# ("a".."z").map.with_index {|char, i| Pointer.new(i, char, n)}
# [
#   [1,2,3],
#   [4,5,6],
#   [7,8,9]
# ]

# [*1..10]

# snail1(5)
# snail2("a", "y")
# a b c d e
# f g h i j
# k l m n o
# p q r s t
# u v w x y
# [[1,2,3],
#  [8,9,4],
# [7,6,5]]
#<StringPointer:0x00000002048b28 @i="a", @x=0.0, @y=0.0, @visited=false>
#<StringPointer:0x00000002048a60 @i="f", @x=0.0, @y=1.0, @visited=false>
#<StringPointer:0x00000002048998 @i="k", @x=0.0, @y=2.0, @visited=false>
#<StringPointer:0x000000020488d0 @i="p", @x=0.0, @y=3.0, @visited=false>
#<StringPointer:0x00000002048808 @i="u", @x=0.0, @y=4.0, @visited=false>
# a.rb:26:in `next_pointer': undefined method `visited' for nil:NilClass (NoMethodError)
#         from a.rb:95:in `snail2'
#         from a.rb:110:in `<main>'

# current = Pointer.all(9).first  #Pointer.new(1)
#  until current
# puts current 
# curnnet.next ==> Pointer.new(2)

#  Array.new(n).map{ |x| x = Array.new(n) }

# i -> x, y
# 1 -> 0, 0
# 2 -> 1, 0
# 3 -> 2, 0
# 4 -> 0, 1
# 5 -> 1, 1
# 6 -> 2, 1
# 7 -> 0, 2
# 8 -> 1, 2
# 9 -> 2, 2

# x = (i - 1) % 3
# y = (i - 1) / 3

# a.rb:2:in `<class:Pointer>': uninitialized constant Pointer::ClassMethods (NameError)
        # from a.rb:1:in `<main>'
        
def snail(array)
  return [] if array.flatten.empty?
  sorted = [] 
  current = StringPointer.generated_by_array(array).first
  while current
    sorted << current.i
    current = current.next_pointer
  end
  sorted
end

# snail3([[1,2,3],
#         [4,5,6],
#         [7,8,9]])
