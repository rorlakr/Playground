def loop_size(node)
  data = []
  
  n = node
  loop do
    n = n.next
    id = n.object_id
    if data.index(id)
      return data.size - data.index(id)
    end
    data << id
  end
end

#use this if you want to create your code on you computer the class of the node is in the description
def create_chain_for_test(tail_size, loop_size)
  prev_node = start = Node.new
  start.next = start
  return start if loop_size == 1
  (1..tail_size).each do |i|
    prev_node.next = Node.new
    prev_node = prev_node.next
  end
  end_loop = prev_node
  (1...loop_size).each do |i|
    prev_node.next = Node.new
    prev_node = prev_node.next
  end
  prev_node.next = end_loop
  start
end
