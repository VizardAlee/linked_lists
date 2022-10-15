# Node
class Node
  attr_accessor :value, :next

  def initialize(data, next_node)
    @data = data
    @next = next_node
  end
end