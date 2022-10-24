# frozen_string_literal: true

require_relative 'node'
class LinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def appends(value)
    if @head
      tail.next = Node.new(value, nil)
    else
      @head = Node.new(value, nil)
    end
  end

  def head_display
    @head.data
  end

  def tail_display
    tail.data
  end

  def tail
    current_node = @head

    return current_node if !current_node.next
    return current_node if !current_node.next while(current_node = current_node.next)
  end

  def prepends(value)
    new_node = Node.new(value, @head)
    @head = new_node
  end

  def size
    current_node = @head
    return 0 if @head.nil?

    count = 1
    until current_node.next.nil?
      count += 1
      current_node = current_node.next
    end
    count
  end

  def at(index = 0)
    return 'Please input a value!' if index < 1

    current_node = @head
    humanize = index - 1
    humanize.times do
      return 'Warning!!! Exceeded list length' if current_node.next.nil?

      current_node = current_node.next
    end
    current_node.data
  end

  def pop_list
    return 'The list is currently empty' if @head.nil?

    current_node = @head
    current_node = current_node.next until current_node.next.next.nil?

    last_node = current_node.next
    current_node.next = nil
    last_node
  end

  def contains?(value, current_node = @head)
    return true if current_node.data == value
    return false if current_node.next.nil?

    contains?(value, current_node.next)
  end

  def find(value, current_node = @head, count = 0)
    return "In index #{count + 1}" if current_node.data == value
    return 'No such data here' if current_node.next.nil?

    find(value, current_node.next, count += 1)
  end

  def to_s
    current_node = @head
    until current_node.next.nil?
      current_node = current_node.next
      print " ( #{current_node.data} ) -> "
    end
    print "nil"
  end
end

list = LinkedList.new
list.appends('Salaam!')
list.appends('I pray for wealth')
list.prepends('Bismillah')
list.appends('I pray for love')
list.head_display
list.tail_display
list.size
list.at(4)
list.pop_list
list.pop_list

list.prepends('Ya Allah!')
p list.contains?('Bismillah')
p list.find('Bismillah')
list.to_s