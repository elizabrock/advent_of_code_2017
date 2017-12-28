class Day7
  def self.part1(input)
    tree = Tree.build_tree(input)
    tree.root.data
  end

  def self.part2(input)
    tree = Tree.build_tree(input)
    unbalanced_branch = tree.root.unbalanced_branch
    unbalanced_branch.weight - unbalanced_branch.unbalanced_by
  end

  class Tree
    def self.build_tree(input)
      node_data = input.split("\n")
      Tree.new(node_data)
    end

    attr_reader :root

    def initialize(nodes_data)
      root_node_data = find_root_from(nodes_data)
      @root = Node.new(root_node_data, nodes_data)
    end

    def find_root_from(node_data)
      # discard any nodes that don't have children
      non_leafs = node_data.find_all{ |line| line.include? "->" }
      # discard any node that is mentioned by another node
      loop do
        candidate = non_leafs.shift
        candidate_name = candidate.split(" ").first
        unless non_leafs.detect{ |non_leaf| non_leaf.include? candidate_name }
          return candidate
        end
      end
    end

    def root=(value)
      @root = value
    end
  end

  class Node
    attr_reader :data, :weight, :children, :unbalanced_by
    def initialize(node_data, other_nodes_data)
      matches = node_data.match(/(\w+) \((\d+)\)[ ->]*(.*)/).to_a
      @data = matches[1]
      @weight = matches[2].to_i
      child_node_names = matches[3]
      @children = []
      return if child_node_names.nil?
      child_node_names.split(", ").each do |node_name|
        child_node_data = other_nodes_data.find{ |line| line.start_with? node_name }
        other_nodes_data.delete(child_node_data)
        @children << Node.new(child_node_data, other_nodes_data)
      end
      # sort by weight, so that the oddball is either first or last
      @children.sort!{ |a, b| a.total_weight <=> b.total_weight }
    end

    def unbalanced_branch
      return nil if @children.empty?
      # Ask each of my children to look for an unbalanced node
      @children.each do |child|
        unbalanced_descendant = child.unbalanced_branch
        if unbalanced_descendant.nil?
          puts "I (#{@data}) have no unbalanced deeper descendants"
          # do nothing, keep looping
        else
          puts "returning my unbalanced descendant"
          return unbalanced_descendant
        end
      end
      #
      #
      # unbalanced_descendant = @children.map(&:unbalanced_branch).compact
      # return unbalanced_descendant[0] unless unbalanced_descendant.empty?
      weights = @children.map(&:total_weight)
      unbalanced_child = nil
      if weights.uniq.length == 1
        return nil # The children are balanced
      elsif weights[0] != weights[1]
        unbalanced_child = @children[0]
      else
        unbalanced_child = @children.last
      end
      unbalanced_child.unbalanced_by = weights.last - weights.first
      puts "Returning my (#{@data}) unbalanced child #{unbalanced_child.data}"
      unbalanced_child
    end

    def total_weight
      @total_weight ||= children.inject(@weight){ |sum, node| sum + node.weight }
    end

    def unbalanced_by=(value)
      @unbalanced_by = value
    end
  end
end
