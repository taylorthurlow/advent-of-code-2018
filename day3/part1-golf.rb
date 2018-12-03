#!/usr/bin/env ruby

data = File.read('data.txt').chomp.split("\n").map do |d|
  d.match(/#(\d+) @ (\d+),(\d+): (\d+)x(\d+)/)
end
counts = Array.new(1000) { Array.new(1000, 0) }

data.map(&:to_a).map { |a| a.map(&:to_i) }.each do |_, _, left, top, width, height|
  (top..top + height - 1).each do |row|
    (left..left + width - 1).each do |col|
      counts[row][col] += 1
    end
  end
end

puts counts.flatten.count { |e| e >= 2}
