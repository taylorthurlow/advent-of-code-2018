#!/usr/bin/env ruby

data = File.read('data.txt').chomp.split("\n")

# PART 1
puts data.sum(&:to_i)

# PART 2
found = nil
list = [0]
f = 0

until found
  data.each do |d|
    f += d.to_i
    found = f if list.include? f
    break if found

    list << f
  end
end

puts found

