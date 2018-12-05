#!/usr/bin/env ruby

chars = File.read('data.txt').chomp.chars
results = {}

def react(chars)
  loop { (r = chars.find_index.with_index { |c, i| c == chars[i+1]&.swapcase }) ? (2.times { chars.delete_at(r) }) : (break) }
  return chars.count
end

('a'..'z').each { |p| results[p] = react(chars.clone.delete_if { |c| c.downcase == p }) }
puts "result: #{results.values.min}"
