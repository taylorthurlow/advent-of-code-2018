#!/usr/bin/env ruby

data = File.read('data.txt').chomp.chars

loop do
  changes = false

  data.each_index do |i|
    next unless data[i] == data[i + 1]&.swapcase

    data.delete_at(i)
    data.delete_at(i)
    changes = true
    break
  end

  break unless changes
end

puts data.count
