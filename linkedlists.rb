require 'pry'

class LinkedList
     def initialize
     @list = []
     end

     def append(node_value)
     node = Node.new(node_value)
     @list << node
     if @list.length > 1
       if @list[-2].next_node == nil
        @list[-2].next_node = @list[-1].value
       end
     end
     end

     def prepend(node_value)
      node = Node.new(node_value)
      node.next_node = @list[0].value
      @list.unshift(node)
     end

     def size
      puts @list.size
     end

     def head 
      puts "value: " + @list[0].value
      puts "next_node: " + @list[0].next_node
     end

     def tail
      puts "value: " + @list[-1].value
      puts "next_node: nil"
     end

     def at(index)
      puts "value: " + @list[index].value
      if @list[index].next_node != nil
      puts "next_node: " + @list[index].next_node
      else
      puts "next_node: nil"
      end
     end

     def pop
      @list.pop
      @list[-1].next_node = nil
     end

     def contains?(value)
      @list.any?{|node| node.value == value}
     end

     def find(value)
      @list.each_with_index{|node, index| 
      if node.value == value
          return index
      end
      }
     end

     def to_s
      values = []
      @list.each{|node|
       values << '( ' + node.value + ' )' 
     }
     values << 'nil'
     values.join(' -> ')
     end

     def insert_at(value, index)
     node = Node.new(value)
     node.next_node = @list[index].value
     @list.insert(index, node)
     @list[index + 1].next_node = @list[index + 2].value if @list[index + 2] != nil
     @list[index - 1].next_node = @list[index].value
     end

     def remove_at(index)
     return 'index is nil' if @list[index] == nil
     @list.delete_at(index)
     @list[index - 1].next_node = @list[index].value
     end
end

class Node
 attr_accessor :next_node
 attr_reader :value
  def initialize(value = nil, next_node = nil)
   @value = value
   @next_node = next_node
  end

end

list = LinkedList.new

binding.pry