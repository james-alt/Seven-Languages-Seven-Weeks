# Print the contents of an array of sixteen numbers, 
# four numbers at a time, using just each. Now, do the
# same with each_slice in Enumerable

i = 1
(1..16).each do |num|
    print "#{num} "
    puts "" if (i % 4 == 0)
    i += 1
end

# Enumerable
(1..16).each_slice(4) {|a| p a}

# Update the tree class to accept a nested structure of hashes
# in the initializer

class Tree
    attr_accessor :children, :node_name

    def initialize(items={})
        @node_name = items.keys[0]
        @children = items[@node_name].collect {|key, value| Tree.new({key => value})}
    end

    def self.create_children(items={})
        puts "create :=> #{items}"
        return Tree.new(items)
    end

    def visit_all(&block)
        visit &block
        children.each {|c| c.visit_all &block }
    end
    
    def visit(&block)
        block.call self
    end
end

ruby_tree = Tree.new ( {'grandpa' => {'dad' => {'child 1' => {}, 'child 2' => {} }, 'uncle' => {'child 3' => {}, 'child 4' => {}}}})
ruby_tree.visit_all {|node| puts node.node_name}

# Write a simple grep that will print the lines of a file having any occurences
# of a phrase anywhere in that line. You will need to do a simple regular
# expression match and read lines from a file. (This is surprisingly simple in
# Ruby.) If you want, include line numbers.

puts "What phrase do you want to search for?"
phrase = gets.chomp

# Read the file and find all of the lines with the phrase in it
File.readlines("DayTwo.txt").grep(/#{phrase}/).each {|txt| puts txt}

# To add the line numbers => '=~' lets compare a string to a regular expression
File.readlines("DayTwo.txt").each_with_index {|txt, index| puts "#{index}: #{txt}" if txt =~ /#{phrase}/}