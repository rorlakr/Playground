module School
  def self.whoIsNext(people, nth)
    index = nth - 1
    length = people.length

    while index >= length
      index -= length
      index /= 2
    end

    people[index]
  end
  
  def self.distance(a_location, a_student)
    puts ">>>>"
    puts a_student.inspect
    puts a_location.inspect
    r = (a_student[0] - a_location["x"]).abs \
        + (a_student[1] - a_location["y"]).abs
    puts r.inspect
    puts ">>>>"
    r
  end
  
  def self.sum_distances_to_location(a_location, students) 
    distances = students.map do |a_student|
      distance(a_location, a_student)
    end
    puts "===="
    puts a_location.inspect
    puts students.inspect
    puts distances.reduce(0, :+)
    puts "===="

    distances.reduce(0, :+)
  end
  
  def self.select_school(students, locations)
    min_distance = 9999
    _id = 0
    distances = locations.map do |a_location|
      if (distance = sum_distances_to_location(a_location, students)) < min_distance
        min_distance = distance
        _id = a_location["id"]
      end
    end
    
    _id
  end
end
