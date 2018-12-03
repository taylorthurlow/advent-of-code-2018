#!/usr/bin/env ruby

data = File.read('data.txt').chomp.split("\n").map do |d|
  d.match(/#(\d+) @ (\d+),(\d+): (\d+)x(\d+)/)
end
counts = Array.new(1000) { Array.new(1000) }
maps = []

data.map(&:to_a).map { |a| a.map(&:to_i) }.each do |_, id, left, top, width, height|
  maps << [id, left, top, width, height]
  (top..top + height - 1).each do |row|
    (left..left + width - 1).each do |col|
      counts[row][col] = [] unless counts[row][col]
      counts[row][col] << id
    end
  end
end

puts maps.find { |id, _, _, width, height| counts.flatten(1).count { |a| a == [id] } == width * height }[0]
