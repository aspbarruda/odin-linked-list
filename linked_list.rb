class LinkedList
  attr_accessor :head
  def initialize
    @head = nil
  end

  def append(value)
    if @head == nil
      @head = Node.new(value)
    else
      tmp = @head
      while tmp.next_node != nil
        tmp = tmp.next_node
      end
      tmp.next_node = Node.new(value)
    end
  end

  def prependd(value)
    @head = Node.new(value, @head)
  end
end

class Node
  attr_accessor :next_node, :value
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

list = LinkedList.new
list.append(3)
list.append(2)
list.prependd(5)
puts list.head.value, list.head.next_node.value, list.head.next_node.next_node.value