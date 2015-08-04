class Survivors
  attr_reader :survivors, :k

  def initialize(total)
    @survivors = [*1..total]
  end

  def last(k)
    @k = k
    kill until survivors.size == 1
    survivors.last
  end

  private

  def kill
    survivors.rotate!(k).pop
  end
end

def josephus(n, k)
  Survivors.new(n).last(k)
end

n, k = ARGF.argv.map(&:to_i)
p josephus(n, k)
