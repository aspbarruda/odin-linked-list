class LinkedList
  attr_accessor :head_node
  def initialize
    @head_node = nil
    @tail_node = nil
  end

  def append(value)
    if @head_node == nil
      @head_node = Node.new(value)
    else
      tmp = @head_node
      while tmp.next_node != nil
        tmp = tmp.next_node
      end
      tmp.next_node = Node.new(value)
      @tail_node = tmp.next_node
    end
  end

  def prepend(value)
    @head_node = Node.new(value, @head_node)
  end

  def size
    tmp = @head_node
    size = 0
    until tmp.nil?
      tmp = tmp.next_node
      size += 1
    end
    puts "There are #{size} nodes!" if size > 1
    puts "There is #{size} node!" if size == 1
    puts "There are no nodes!" if size == 0
  end

  def head
    if @head_node.nil?
      puts "There are no nodes!"
      return
    end
    puts "The head of the linked list is #{@head_node.value}"
  end

  def tail
    if @head_node.nil?
      puts "There are no nodes!"
      return
    end
    puts "The tail of the linked list is #{@tail_node.value}"
  end

  def at(index)
    tmp = @head_node
    i = 0
    until i == index || tmp.nil?
      tmp = tmp.next_node
      i += 1
    end
    if tmp.nil?
      puts "Index not present at this linked list!"
    else
      puts "Value at #{i} is #{tmp.value}"
    end
  end

  def pop
    if @head_node == nil
      puts "Cannot pop element, list is empty"
      return
    elsif @head_node.next_node.nil?
      @head_node = nil
      return
    end
    cur = @head_node
    tmp = @head_node.next_node
    until tmp.next_node.nil?
      cur = tmp
      tmp = tmp.next_node
    end
    cur.next_node = nil
    @tail_node = cur
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
list.prepend(5)
puts list.head_node.value, list.head_node.next_node.value, list.head_node.next_node.next_node.value
list.pop
list.pop
list.pop
list.size
list.head
list.tail
list.at(2)