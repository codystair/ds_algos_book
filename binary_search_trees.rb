class TreeNode
  attr_accessor :value, :left_child, :right_child

  def initialize(value, left_child=nil, right_child=nil)
    @value = value
    @left_child = left_child
    @right_child = right_child
  end

  def search(search_value, node)
    if !node || node.value == search_value
      return node
    elsif search_value < node.value
      return search(search_value, node.left_child)
    else
      return search(search_value, node.right_child)
    end
  end

  def insert(value, node)
    if value < node.value
      if !node.left_child
        node.left_child = TreeNode.new(value)
      else
        insert(value, node.left_child)
      end
    elsif value > node.value
      if !node.right_child
        node.right_child = TreeNode.new(value)
      else
        insert(value, node.left_child)
      end
    else
  end

  def delete(value, node)
    if !node
      return nil
    elsif value < node.value
      node.left_child = delete(value, node.left_child)
      return node
    elsif value > node.value
      node.right_child = delete(value, node.right_child)
      return node
    elsif value === node.value
      if !node.left_child
        return node.right_child
      elsif !node.right_child
        return node.left_child
      else
        node.right_child = lift(node.right_child, node)
        return node
      end
    end
  end

  def lift(node, node_to_delete)
    if node.left_child
      node.left_child = lift(node.left_child, node_to_delete)
      return node
    else
      node_to_delete.value = node.value
      return node.right_child
    end
  end

  def greatest(node)
    return node.value if !node.right_child
    return greatest(node.right_child)
  end
end

node1 = TreeNode.new(25)
node2 = TreeNode.new(75)
root = TreeNode.new(50, node1, node2)
