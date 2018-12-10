#!/usr/bin/env ruby

data = File.read('data.txt').chomp.split("\n").map { |d| d.scan(/[\d-]+/).map(&:to_i).each_slice(2).to_a }

def display(stars)
  positions = stars.map { |d| d[0] }
  x_coords = positions.map { |p| p[0] }
  y_coords = positions.map { |p| p[1] }

  x_range = (x_coords.min..x_coords.max)
  y_range = (y_coords.min..y_coords.max)

  return false unless x_range.size <= 100 && y_range.size <= 100

  y_range.each do |y|
    x_range.each do |x|
      if positions.any? { |p| p[0] == x && p[1] == y }
        print '#'
      else
        print ' '
      end
    end

    puts ''
  end

  true
end

seconds = 0
loop do
  close = display(data)
  if close
    puts "Seconds: #{seconds}"
    waiting = gets # press enter to go to next second
  end

  seconds += 1

  data.map! do |position, velocity|
    position[0] += velocity[0]
    position[1] += velocity[1]

    [position, velocity]
  end
end
