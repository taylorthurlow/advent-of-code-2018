#!/usr/bin/env ruby

data = File.read('data.txt').chomp.split(' ').map(&:to_i)

class Node
  attr_accessor :children, :metadata

  def initialize(children, metadata)
    @children = children
    @metadata = metadata
  end
end

def process(list, all_nodes)
  num_children = list.delete_at(0)
  num_metadata = list.delete_at(0)

  children = []
  while num_children.positive?
    children << process(list, all_nodes)
    num_children -= 1
  end

  metadata = list.shift(num_metadata)
  node = Node.new(children, metadata)
  all_nodes << node
  node
end

all_nodes = []
process(data, all_nodes)
puts all_nodes.map(&:metadata).flatten.sum
