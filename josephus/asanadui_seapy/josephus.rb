
class Josephus
  def survivor(n:, k:)
    list = (1..n).to_a
    list.rotate!(k-1).shift while list.length > 1
    list.first
  end
end
