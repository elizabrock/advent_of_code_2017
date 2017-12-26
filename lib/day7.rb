class Day7
  def self.part1(input)
    tree = Tree.build_tree(input)
    tree.root
  end
end

class Tree
  def self.build_tree(input)
    node_data = input.split("\n")
    Tree.new(node_data)
  end

  attr_reader :root

  def initialize(node_data)
    @root = find_root_from(node_data)
  end

  def find_root_from(node_data)
    # discard any nodes that don't have children
    non_leafs = node_data.find_all{ |line| line.include? "->" }
    # discard any node that is mentioned by another node
    loop do
      candidate = non_leafs.pop.split(" ").first
      unless non_leafs.detect{ |non_leaf| non_leaf.include? candidate }
        return candidate
      end
    end
  end

  def root=(value)
    @root = value
  end

end
