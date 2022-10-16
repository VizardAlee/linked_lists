require_relative 'node'

# linked list
class LinkedList
 attr_reader :head, :tail

  def initialize(data)
    @head = nil
    @tail = nil
  end

  def append(value)
    new_node = Node.new(value, nil)
    @head ||= new_node
    if !@tail
      @tail = new_node
    else
      @tail.next = new_node
    end
    @tail = new_node
    # adds new node containing #value to the end of the list
  end

  def prepends(value)
    new_node = Node.new(value, @head)
    @head = new_node
    # adds new node to the start of the list
  end

  def size
    current_node = @head
    count = 0 # for the head node
    until current_node.nil?
      count += 1
      current_node = current_node.next
    end
    count
  end

  def list
    current_node = @head
    list_end = false
    set = []
    until list_end
      set << current_node.data
      if current_node == @tail
        list_end = true
      else
        current_node = current_node.next
      end
    end
    set
  end

  def head
    list[0]
    # returns the first node in the list
  end

  def tail
    list[-1]
    # returns the last node on the list
  end

  def at(index)
    current_node = @head
    index.times do
      current_node = current_node.next
    end
    current_node.data
    # returns the node at a given index
  end

  def pop
    return if @head == nil

    current_node = @head
    find = nil
    until current_node.next.nil?
      find = current_node
      current_node = current_node.next
    end

    if find.nil?
      @head = nil
      @tail = nil
    else
      @tail = find
      find.next = nil
    end
    # removes the last element from the list
  end

  def contains?(value)
    current_node = @head

    until current_node.nil?
      return true if current_node.data == value

      current_node = current_node.next
    end
    false
    # returns true if the passed value is in the list and otherwise returns false
  end

  def find(value)
    current_node = @head
    count = 0
    until current_node.nil?
      break if current_node.data == value

      current_node = current_node.next
      count += 1
    end
    count
    # returns the index of the node containing value, or nil if not found
  end

  def to_s
    string = ''
    current_node = @head
    until current_node.nil?
      if current_node.nil?
        string << '( nil ) -> '
      else
        string << "( #{current_node.data} ) -> "
      end
      current_node = current_node.next
    end

    string << 'nil'
    # represent your LinkedList objects as string,  so you can print them out and preview them in the console
    # the format should be: (value) -> (value) -> (value) -> nil
  end
end
ags = LinkedList.new('Word')
ags.append('Wealth')
ags.prepends('Money')
ags.append('Power')
ags.size
ags.list

p ags.contains?('Power')
p ags.to_s