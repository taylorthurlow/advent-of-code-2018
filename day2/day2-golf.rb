#!/usr/bin/env ruby

data = File.read('data.txt').chomp.split("\n")

# PART 1
twos, threes = 0, 0
data.each do |d|
  twos += 1 if d.each_char.select { |c| d.count(c) if d.count(c) == 2 }.uniq.count > 0
  threes += 1 if d.each_char.select { |c| d.count(c) if d.count(c) == 3 }.uniq.count > 0
end
puts twos * threes


# PART 2
data.each_with_index do |d1, i|
  data[i + 1..data.size].each do |d2, j|
    diff = d1.each_char.with_index.count { |c, k| c != d2.chars[k] }
    puts [d1, d2] if diff == 1
  end
end

