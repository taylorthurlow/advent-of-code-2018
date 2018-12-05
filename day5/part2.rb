#!/usr/bin/env ruby

data = File.read('data.txt').chomp.chars

def react(chars)
  loop do
    result = chars.find_index.with_index { |c, i| c == chars[i + 1]&.swapcase }

    if result
      chars.delete_at(result)
      chars.delete_at(result)
    else
      break
    end
  end

  return chars.count
end

results = {}

('a'..'z').each do |p|
  print "#{p}: "
  pruned = data.clone
  pruned.delete_if { |c| c.downcase == p }
  results[p] = react(pruned)
end

puts "result: #{results.values.min}"
