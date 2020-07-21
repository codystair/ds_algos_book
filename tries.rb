class TrieNode
  attr_accessor :children

  def initialize()
    @children = {}
  end
end

class TrieNode
  attr_accessor :root

  def initialize()
    @root = TrieNode.new
  end

  def search(word)
    current_node = @root

    word.each_char do |char|
      if current_node.children[char]
        current_node = current_node.children[char]
      else
        return nil
      end
    end

    current_node
  end

  def insert(word)
    current_node = @root

    word.each_char do |char|
      if current_node.children[char]
        current_node = current_node.children[char]
      else
        new_node = TrieNode.new
        current_node.children[char] = new_node
        current_node = new_node
      end
    end

    current_node.children['*'] = nil
  end

  def print_nodes(node=nil)
    current_node = node || @root

    current_node.children.each do |key, child_node|
      p key
      print_nodes(child_node) if key != '*'
    end
  end
end
