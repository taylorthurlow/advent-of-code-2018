#!/usr/bin/env ruby

def process(list, all_nodes)
  num_children = list.shift
  num_metadata = list.shift
  all_nodes << [(0..num_children - 1).to_a.map { process(list, all_nodes) }, list.shift(num_metadata)]
  all_nodes.last
end

all_nodes = []
process(File.read('data.txt').chomp.split(' ').map(&:to_i), all_nodes)
puts all_nodes.map { |n| n[1] }.flatten.sum
