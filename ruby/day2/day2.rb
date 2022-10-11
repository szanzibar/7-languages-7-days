# Exercise 1
sixteen = [8, 3, 0, 7, 9, 6, 1, 3, 9, 6, 0, 7, 9, 5, 5, 3]
section = []

puts 'using each:'
sixteen.each do |elem|
  section.append(elem)
  next unless section.count == 4

  puts "#{section}"
  section = []
end

puts "\nusing each_slice:"
sixteen.each_slice(4) { |slice| puts "#{slice}" }

# Exercise 2
class Tree
  attr_accessor :children, :node_name

  def initialize(hash)
    # assumes there will only ever by 1 parent
    hash.each_pair do |k, v|
      @node_name = k

      @children = []
      v.each_pair do |k, v|
        @children.append(Tree.new({ k => v }))
      end
    end
  end

  def visit_all(&block)
    visit(&block)
    children.each { |c| c.visit_all(&block) }
  end

  def visit(&block)
    block.call self
  end
end

puts "\nNew tree"

tree = Tree.new({ 'grandpa' => { 'dad' => { 'child 1' => {}, 'child 2' => {} }, 'uncle' => { 'child 3' => {},
                                                                                             'child 4' => {} } } })
puts 'Visiting a node'
tree.visit { |node| puts node.node_name }
puts 'visiting entire tree'
tree.visit_all { |node| puts node.node_name }

# Exercise 3
puts
puts 'Enter search query'
query = gets.chomp
puts "searching for '#{query}'"
File.foreach('search_file.txt') do |line|
  puts line if line =~ Regexp.new(query, true)
end
