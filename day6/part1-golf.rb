#!/usr/bin/env ruby

data = File.read('data.txt').chomp.split("\n").map.with_index do |d, i|
  [i, d.match(/(\d+), (\d+)/)[1..2].map(&:to_i)]
end

grid = Array.new(1000) { Array.new(1000) }
1000.times do |i|
  1000.times do |j|
    dists = data.map { |id, coords| [id, (coords[0] - i).abs + (coords[1] - j).abs] }
    closest = dists.min_by { |_, dist| dist }
    grid[j][i] = closest[0] if dists.map{ |d| d[1] }.count(closest[1]) == 1
  end
end

infinites = [grid[0], grid[999], grid.map { |r| r[0] }, grid.map { |r| r[999] }].flatten.compact

flat = grid.flatten.compact.reject { |e| infinites.include? e }
freq = flat.inject(Hash.new(0)) { |h, v| h[v] += 1; h }
puts flat.count(flat.max_by { |v| freq[v] })
