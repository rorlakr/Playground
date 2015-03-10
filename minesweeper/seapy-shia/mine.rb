"""
이번 코딩도장 문제는 '지뢰찾기' 입니다.
정수 n과 m 에 대하여, n x m 크기의 지뢰밭과 힌트 위치를 출력하면 됩니다.
예1) n = 4, m = 4
. . . .
. . * .
* . . .
. . . .

0 1 1 1
1 2 * 1
* 2 1 1
1 1 0 0

예2) n = 5, m = 3
. . . * .
* . * . .
. . . . .

1 2 2 * 1
* 2 * 2 1
1 2 1 1 0
"""

class Array
  def dup_each_with_index(&block)
    self.each_with_index do |inner, idx1|
      inner.each_with_index do |ii, idx2|
        block.call(idx1,idx2,ii)
      end
    end
  end

  def to_pretty_str
    result = []
    self.each do |arr|
      result << arr.join(' ')
    end
    result.join("\n")
  end

  def dup_map_with_index(&block)
    self.map.with_index do |inner, idx1|
      inner.map.with_index do |ii, idx2|
        block.call(idx1,idx2,ii)
      end
    end
  end
end

class MineSweeper
  attr_accessor :n, :m, :map, :hint_map
  MINE_MARK = '*'
  NONE_MINE_MARK = '.'

  def initialize(n,m)
    @n = n
    @m = m

    generate
    analyze
  end

  def show_map
    puts @map.to_pretty_str
  end

  def show_hint
    puts @hint_map.to_pretty_str
  end

  private
  def generate
    @map = Array.new(@n) { Array.new(@m) { rand(10) < 2 ? MINE_MARK : NONE_MINE_MARK } }

    @hint_map = @map.dup_map_with_index do |n,m,data|
      @map[n][m] == MINE_MARK ? MINE_MARK : 0
    end
  end

  def analyze
    @map.dup_each_with_index do |nn,mm,ii|
      plus_mine(nn, mm) if @map[nn][mm] == MINE_MARK
    end
  end

  def plus_mine(n, m)
    arr = (-1..1).to_a.product((-1..1).to_a)

    arr.each do |v|
      tn = n + v[0]
      tm = m + v[1]
      next if tn < 0 || tn >= @n
      next if tm < 0 || tm >= @m
      next if @hint_map[tn][tm] == MINE_MARK
      @hint_map[tn][tm] += 1 unless tn == n && tm == m
    end
  end
end

ms = MineSweeper.new(ARGV[0].to_i,ARGV[1].to_i)
ms.show_map
puts
ms.show_hint