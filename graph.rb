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
end

alice = Vertex.new('alice')
bob = Vertex.new('bob')
cynthia = Vertex.new('cynthia')

alice.add_adjacent_vertex(bob)
alice.add_adjacent_vertex(cynthia)
bob.add_adjacent_vertex(cynthia)
cynthia.add_adjacent_vertex(bob)
