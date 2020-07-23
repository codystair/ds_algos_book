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

class WeightedGraphVertex
  attr_accessor :value, :adjacent_vertices

  def initialize(value)
    @value = value
    @adjacent_vertices = {}
  end

  def add_adjacent_vertex(vertex, weight)
    @adjacent_vertices[vertex] = weight
  end
end

def City
  attr_accessor :name, :routes

  def initialize(name)
    @name = name
    @routes = {}
  end

  def add_route(city, price)
    @routes[city] = price
  end
end

def dijkstra_shortest_path(starting_city, final_destination)
  cheapest_prices_table = {}
  cheapest_previous_stopover_city_table = {}
  unvisited_cities = []
  visited_cities = {}
  cheapest_prices_table[starting_city.name] = 0
  current_city = starting_city

  while current_city
    visited_cities[current_city.name] = true
    unvisited_cities.delete(current_city)

    current_city.routes.each do |adjacent_city, price|
      unvisited_cities << adjacent_city unless visited_cities[adjacent_city.name]
      price_through_current_city = cheapest_prices_table[current_city.name] + price

      if !cheapest_prices_table[adjacent_city.name] ||
        price_through_current_city < cheapest_prices_table[adjacent_city.name]
        cheapest_prices_table[adjacent_city.name] = price_through_current_city
        cheapest_previous_stopover_city_table[adjacent_city.name] = current_city.name
      end
    end

    current_city = unvisited_cities.min do |city|
      cheapest_prices_table[city.name]
    end
  end

  shortest_path = []
  current_city_name = final_destination.name

  while current_city_name != starting_city.name
    shortest_path << current_city_name
    current_city_name = cheapest_previous_stopover_city_table[current_city_name]
  end

  shortest_path << starting_city.name
  return shortest_path.reverse
end

alice = Vertex.new('alice')
bob = Vertex.new('bob')
cynthia = Vertex.new('cynthia')

alice.add_adjacent_vertex(bob)
alice.add_adjacent_vertex(cynthia)
bob.add_adjacent_vertex(cynthia)
cynthia.add_adjacent_vertex(bob)

atlanta = City.new("Atlanta")
boston = City.new("Boston")
chicago = City.new("Chicago")
denver = City.new("Denver")
el_paso = City.new("El Paso")
atlanta.add_route(boston, 100)
atlanta.add_route(denver, 160)
boston.add_route(chicago, 120)
boston.add_route(denver, 180)
chicago.add_route(el_paso, 80)
denver.add_route(chicago, 40)
denver.add_route(el_paso, 140)
