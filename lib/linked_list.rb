require_relative 'node'

# linked list
class LinkedList

  def initialize(data)
    @head = Node.new(data, nil)
  end

  def append(value)
    current_node
    # adds new node containing #value to the end of the list
  end

  def prepend(value)
    # adds new node to the start of the list
   
  end

  def size
    self.size
  end

  def head
    # returns the first node in the list

  end

  def tail

    # returns the last node on the list
  end

  def at(index)
    # returns the node at a given index

  end

  def pop
    # removes the last element from the list

  end

  def contains?(value)

    # returns true if the passed value is in the list and otherwise returns false
  end

  def find(value)
    # returns the index of the node containing value, or nil if not found
  end

  def to_s

    # represent your LinkedList objects as string,  so you can print them out and preview them in the console
    # the format should be: (value) -> (value) -> (value) -> nil
  end
end
ags = LinkedList.new('word')
p ags.append('Wealth')