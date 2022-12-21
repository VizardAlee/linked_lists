# frozen_string_literal: true

require_relative 'lib/node'
require_relative 'lib/linked_list'

list = LinkedList.new
list.append('Aliyu')
list.append('Nuhu')
list.append('Salisu')
list.list_prepend('Malik')
p list.size
p list.at(8)
p list.list_pop
p list.size
p list.head
p list.contains?('Nuhu')
p list.find('Malik')
list.insert_at('Shamo', 1)
list.append('try')
p list.remove_at(1)
p list.remove_at(3)
puts list
