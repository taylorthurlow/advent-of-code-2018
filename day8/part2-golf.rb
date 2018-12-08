#!/usr/bin/env ruby

def process(list)
  num_children = list.delete_at(0)
  num_metadata = list.delete_at(0)
  [(0..num_children - 1).to_a.map { process(list) }, list.shift(num_metadata)]
end

def value(node)
  node[0].any? ? node[1].map { |m| m != 0 && (m - 1) >= 0 && (m - 1) < node[0].size ? value(node[0][m - 1]) : 0 }.sum : node[1].sum
end

puts value(process(File.read('data.txt').chomp.split(' ').map(&:to_i)))
