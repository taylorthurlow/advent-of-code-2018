#!/usr/bin/env ruby

data = File.read('data.txt').chomp.split("\n")
data.map! { |d| d.match(/#(\d+) @ (\d+),(\d+): (\d+)x(\d+)/) }
size = 1000
counts = Array.new(size) { Array.new(size) }
maps = []

data.map(&:to_a).map { |a| a.map(&:to_i) }.each do |_, id, left, top, width, height|
  maps << [id, left, top, width, height]
  w_range = (left..left + width - 1)
  h_range = (top..top + height - 1)

  h_range.each do |row|
    w_range.each do |col|
      counts[row][col] = [] unless counts[row][col]
      counts[row][col] << id
    end
  end
end

list = counts.flatten(1)
soln = maps.find do |id, left, top, width, height|
  list.count { |a| a == [id] } == width * height
end

puts soln[0]
