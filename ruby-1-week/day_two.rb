#---
# Excerpted from "Seven Languages in Seven Weeks",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/btlang for more book information.
#---
class Tree
  attr_accessor :children, :node_name

  def initialize(name, children = [])
    @children = children
    @node_name = name
  end

  def visit_all(&block)
    visit &block
    children.each { |c| c.visit_all &block }
  end

  def visit(&block)
    block.call self
  end
end

ruby_tree = Tree.new("Ruby",
                     [Tree.new("Reia"),
                      Tree.new("MacRuby")])

puts "Visiting a node"
ruby_tree.visit { |node| puts node.node_name }
puts

puts "visiting entire tree"
ruby_tree.visit_all { |node| puts node.node_name }

#1
file = File.open("text1.txt")
puts "#1 #{file.read}"
file.close

file_data = File.read("text1.txt")
puts "#1.1 #{file_data}"

#2
numbers = { 1 => 'one', 2 => 'two' }
arr = []
numbers.values.each { |value| arr.push(value) }
puts "#2 #{arr}"

#3
arr = []
i = 0
while i < 16
  arr.push(i)
  i += 1
end

i = 0
str = ""
arr.each do |val|
  i += 1
  str += val.to_s
  if i == 4
    puts "#3 #{str}"
    str = ""
    i = 0
  end
end

arr.each_slice(4) { |slice| puts "#3.1 #{slice}" }

#4

#5
File.foreach("text1.txt") do |line|
  if line.index("text3")
    puts "#5 line is: #{line}"
  end
end