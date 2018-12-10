#!/usr/bin/env ruby

def display(stars)
  x_coords = stars.map { |d| d[0] }.map { |p| p[0] }
  y_coords = stars.map { |d| d[0] }.map { |p| p[1] }

  return false unless (x_coords.min..x_coords.max).size <= 100 && (y_coords.min..y_coords.max).size <= 100

  (y_coords.min..y_coords.max).each do |y|
    (x_coords.min..x_coords.max).each do |x|
      stars.map { |d| d[0] }.any? { |p| p[0] == x && p[1] == y } ? print('#') : print(' ')
    end
    puts ''
  end

  true
end

data = File.read('data.txt').chomp.split("\n").map { |d| d.scan(/[\d-]+/).map(&:to_i).each_slice(2).to_a }
seconds = 0
loop do
  puts seconds && gets if display(data)
  seconds += 1
  data.map! do |position, velocity|
    position[0] += velocity[0]
    position[1] += velocity[1]
    [position, velocity]
  end
end
