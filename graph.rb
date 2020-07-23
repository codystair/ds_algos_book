class Queue
  def initialize
    @data = []
  end

  def enqueue(value)
    @data << value
  end

  def dequeue
    @data.shift
  end

  def read
    @data.first
  end
end

class Vertex
  attr_accessor :value, :adjacent_verticies

  def initialize(value)
    @value = value
    @adjacent_verticies = []
  end

  def add_adjacent_vertex(vertex)
    return if add_adjacent_vertices.include?(vertex)
    @adjacent_verticies << vertex
    vertest.add_adjacent_vertex(self)
  end

  def dfs_traverse(vertex, visited_vertices={})
    visited_vertices[vertex.value] = true

    puts vertex.value

    vertex.adjacent_verticies.each do |adjacent_vertex|
      next if visited_vertices[adjacent_vertex.value]
      dfs_traverse(adjacent_vertex, visited_vertices)
    end
  end

  def dfs(vertex, search_value, visited_vertices={})
    return vertex if vertext.value == search_value

    visited_vertices[vertex.value] = true

    vertex.adjacent_verticies.each do |adjacent_vertex|
      next if visited_vertices[adjacent_vertex.value]
      return adjacent_vertex if adjacent_vertex.value == search_value

      vertex_were_searching_for = dfs(adjacent_vertex, search_value, visited_vertices)
      return vertex_were_searching_for if vertex_were_searching_for
    end

    return nil
  end

  def bfs_traverse(starting_vertex)
    queue = Queue.new

    visited_vertices = {}
    visited_vertices[starting_vertex.value] = true
    queue.enqueue(starting_vertex)

    while queue.read
      current_vortex = queue.dequeue

      puts current_vortex.value

      current_vortex.adjacent_vertices.each do |adjacent_vertex|
        if !visited_vertices[adjacent_vertex.value]
          visited_vertices[adjacent_vertex.value] = true
          queue.enqueue(adjacent_vertex)
        end
      end
    end
  end
end

alice = Vertex.new('alice')
bob = Vertex.new('bob')
cynthia = Vertex.new('cynthia')

alice.add_adjacent_vertex(bob)
alice.add_adjacent_vertex(cynthia)
bob.add_adjacent_vertex(cynthia)
cynthia.add_adjacent_vertex(bob)
