
class Josephus
  def survivor(n:, k:)
    list = (1..n).to_a
    loop do
      list.rotate!(k-1).shift
      break if list.length == 1
    end
    list.first
  end
end
