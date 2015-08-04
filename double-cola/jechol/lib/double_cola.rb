module DoubleCola
  def self.whoIsNext(people, nth)
    index = nth - 1
    length = people.length

    while index >= length
      index -= length
      index /= 2
    end

    people[index]
  end
end
