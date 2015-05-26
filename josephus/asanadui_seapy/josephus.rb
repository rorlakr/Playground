
class Josephus
  def survivor(n:, k:)
    list = (1..n).to_a
    loop do
      list.rotate!(k-1).shift
      if list.length == 1
        break
      end
    end
    list.first
  end
end
