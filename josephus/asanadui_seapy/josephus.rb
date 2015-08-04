
class Josephus
  attr_accessor :survivor_list

  def survivor(n:, k:)
    @survivor_list = []
    list = 1.upto(n).to_a
    loop do
      @survivor_list << list.rotate!(k-1).shift
      break if list.length == 1
    end
    @survivor_list << list.first
    list.first
  end
end
