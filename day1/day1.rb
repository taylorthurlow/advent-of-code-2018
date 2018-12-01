#!/usr/bin/env ruby

data = File.read('data.txt').chomp.split("\n")

# PART 1

f = 0
data.each do |d|
  m = d.match(/([+-])(\d+)/)
  f += m[2].to_i if m[1] == '+'
  f -= m[2].to_i if m[1] == '-'
end

puts f


# PART 2

found = nil
list = [0]
f = 0

until found
  data.each do |d|
    m = d.match(/([+-])(\d+)/)
    f += m[2].to_i if m[1] == '+'
    f -= m[2].to_i if m[1] == '-'
    found = f if list.include? f
    break if found

    list << f
  end
end

puts found
