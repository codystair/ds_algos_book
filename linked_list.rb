class Node
  attr_accessor :data, :next_node, :previous_node

  def initialize(data)
    @data = data
  end
end

class LinkedList
  attr_accessor :first_node

  def initialize(first_node)
    @first_node = first_node
  end

  def read(index)
    current_node = @first_node
    current_index = 0

    while current_node do
      if current_index == index
        return current_node.data
      end

      current_node = current_node.next_node
      current_index += 1
    end
  end

  def index_of(value)
    current_node = @first_node
    current_index = 0

    loop do
      if current_node.data == value
        return current_index
      end

      current_node = current_node.next_node
      current_index += 1
      break unless current_node
    end

    return nil
  end

  def insert_at_index(index, value)
    new_node = Node.new(value)

    if index == 0
      new_node.next_node = first_node
      self.first_node = new_node
      return
    end

    current_node = first_node
    current_index = 0

    while current_index < (index - 1) do
      current_node = current_node.next_node
      current_index += 1
    end

    new_node.next_node = current_node.next_node
    current_node.next_node = new_node
  end

  def print_list
    current_node = self.first_node

    while current_node do
      p current_node.data
      current_node = current_node.next_node
    end
  end

  def last
    current_node = self.first_node
    
    while current_node.next_node
      current_node = current_node.next_node
    end

    current_node.data
  end

  def reverse
    previous_node = nil
    current_node = first_node

    while current_node
      next_node = current_node.next_node

      current_node.next_node = previous_node

      previous_node = current_node
      current_node = next_node
    end

    self.first_node = previous_node
  end
end

class DoublyLinkedList
  attr_accessor :first_node, :last_node

  def initialize(first_node=nil, last_node=nil)
    @first_node = first_node
    @last_node = last_node
  end

  def insert_at_end(value)
    new_node = Node.new(value)

    if !first_node
      @first_node = new_node
      @last_node = new_node
    else
      new_node.previous_node = @last_node
      @last_node.next_node = new_node
      @last_node = new_node
    end
  end

  def reverse_print(value)
    current_node = self.last_node

    while current_node do
      p current_node.data
      current_node = current_node.previous_node
    end
  end
end

node_1 = Node.new('blue')
node_2 = Node.new('green')
node_3 = Node.new('purple')
node_4 = Node.new('black')

node_1.next_node = node_2
node_2.next_node = node_3
node_3.next_node = node_4

list = LinkedList.new(node_1)
list.print_list
p list.last
