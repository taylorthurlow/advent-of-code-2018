#!/usr/bin/env ruby

data = File.read('data.txt').chomp.split("\n").map.with_index { |d, i| [i, d.match(/(\d+), (\d+)/)[1..2].map(&:to_i)] }

grid = Array.new(1000) { Array.new(1000) }
1000.times { |i| 1000.times { |j| grid[i][j] = data.map { |_, coords| (coords[0] - i).abs + (coords[1] - j).abs }.sum } }
puts grid.flatten.count { |e| e < 10000 }
