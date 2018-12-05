#!/usr/bin/env ruby

# Ruby's default interpreter, MRI, does not support multicore scheduling. You
# will need to run it on something like JRuby.

chars = File.read('data.txt').chomp.chars
results = {}

def react(chars)
  loop { (r = chars.find_index.with_index { |c, i| c == chars[i+1]&.swapcase }) ? (2.times { chars.delete_at(r) }) : (break) }
  return chars.count
end

('a'..'z').map { |p| Thread.new { results[p] = react(chars.clone.delete_if { |c| c.downcase == p }) } }.each(&:join)
sleep(1) until results.count == 26
puts "result: #{results.values.min}"
