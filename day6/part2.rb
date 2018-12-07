#!/usr/bin/env ruby

data = File.read('data.txt').chomp.split("\n").map.with_index do |d, i|
  [i, d.match(/(\d+), (\d+)/)[1..2].map(&:to_i)]
end

grid_size = 1000
less_than_target = 10000

grid = Array.new(grid_size) { Array.new(grid_size) }
grid_size.times do |i|
  grid_size.times do |j|
    grid[i][j] = data.map { |_, coords| (coords[0] - i).abs + (coords[1] - j).abs }.sum
  end
end

puts grid.flatten.count { |e| e < less_than_target }
