class WaitList
  attr_reader :array

  def initialize array
    @array = array
  end

  def next_on number
    k = 1
    n = array.size

    remain = number
    while k*n < remain
      remain -= k*n
      k *= 2
    end

    array[(remain - 1) / k]
  end
end

test_set = [
  [["철수", "민호", "수지", "효성", "지수"], 1, "철수"],
  [["철수", "민호", "수지", "효성", "지수"], 52, "수지"],
  [["철수", "민호", "수지", "효성", "지수"], 7230702951, "민호"],
  [["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 1, "Sheldon"],
  [["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 6, "Sheldon"],
  [["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 1802, "Penny"],
  [["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 2, "Leonard"],
  [["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 3, "Penny"],
  [["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 10, "Penny"],
  [["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 534, "Rajesh"],
  [["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 5033, "Howard"],
  [["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 10010, "Howard"],
  [["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 63, "Rajesh"],
  [["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 841, "Leonard"],
  [["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 3667, "Penny"],
  [["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 38614, "Howard"],
  [["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 1745, "Leonard"],
  [["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 1000000000, "Penny"]
]

test_set.each { |el|
  puts WaitList.new(el[0]).next_on(el[1]) == el[2]
}