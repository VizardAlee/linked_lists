# forzen_string_literal: true

require_relative 'node'

# linked list class
class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(value)
    if @head.nil?
      @head = Node.new(value)
    else
      tail.next_node = Node.new(value)
    end
  end

  def list_prepend(value)
    if @head.nil?
      @head = Node.new(value)
    else
      @head = Node.new(value, @head)
    end
  end

  def size(node = @head, count = 0)
    return "#{count} total Nodes" if node.nil?

    size(node.next_node, count + 1)
  end

  def tail
    node = @head

    return node unless node.next_node

    return node unless node.next_node while (node = node.next_node)
  end

  def at(index, count = 0, node = @head)
    return "Index #{index} not in scope" if node.nil?
    return node.value if count == index

    at(index, count + 1, node.next_node)
  end

  def list_pop(node = @head)
    return node.next_node = nil if node.next_node.next_node.nil?

    list_pop(node.next_node)
  end

  def contains?(value, node = @head)
    return false if node.nil?
    return true if node.value == value

    contains?(value, node.next_node)
  end

  def find(value, node = @head, count = 0)
    return "It's either #{value} doesn't exist or the word case doesn't match" if node.nil?
    return "Located at index #{count}" if node.value == value

    find(value, node.next_node, count + 1)
  end

  def to_s(node = @head, string = '')
    return "#{string} nil" if node.nil?

    string << "( #{node.value} ) ->"
    to_s(node.next_node, string)
  end

  def insert_at(value, index, count = 0, node = @head)
    return node.next_node = Node.new(value, node.next_node) if count == index - 1
    return node = Node.new(value) if node.nil?

    insert_at(value, index, count + 1, node.next_node)
  end

  def remove_at(index, count = 0, node = @head)
    return node if node.nil?

    node.next_node = node.next_node.next_node if count == index - 1

    remove_at(index, count + 1, node.next_node)
  end
end
