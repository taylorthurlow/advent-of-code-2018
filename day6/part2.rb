#!/usr/bin/env ruby

require 'pry-byebug'

data = File.read('data.txt').chomp.split("\n").map.with_index do |d, i|
# data = File.read('sample.txt').chomp.split("\n").map.with_index do |d, i|
  [i, d.match(/(\d+), (\d+)/)[1..2].map(&:to_i)]
end

def manhattan(x1, y1, x2, y2)
  (x1 - x2).abs + (y1 - y2).abs
end

grid_size = 1000
less_than_target = 10000

grid = Array.new(grid_size) { Array.new(grid_size) }

grid_size.times do |i|
  grid_size.times do |j|
    grid[i][j] = data.map { |_, coords| manhattan(i, j, coords[0], coords[1]) }.sum

#     dists = data.map { |id, coords| [id, manhattan(i, j, coords[0], coords[1])] }
#     closest = dists.min_by { |_, dist| dist }
#     grid[j][i] = closest[0] if dists.map{ |d| d[1] }.count(closest[1]) == 1
  end
end
# pp grid

puts grid.flatten.count { |e| e < less_than_target }

# edge_values = []
# edge_values << grid[0]
# edge_values << grid[grid_size - 1]
# edge_values << grid.map { |r| r[0] }
# edge_values << grid.map { |r| r[grid_size - 1] }
# infinites = edge_values.flatten.compact

# flat = grid.flatten.compact.reject { |e| infinites.include? e }

# freq = flat.inject(Hash.new(0)) { |h, v| h[v] += 1; h }
# most_id = flat.max_by { |v| freq[v] }
# puts flat.count(most_id)

# grid.each_with_index do |r, i|
#   r.each_with_index do |c, j|
#     match = data.find { |d| d[1][0] == i && d[1][1] == j }
#     grid[i][j] = match[0] if match
#   end
# end
# pp data
# p grid.flatten.uniq
