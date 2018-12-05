#!/usr/bin/env ruby

chars = File.read('data.txt').chomp.chars
loop { (r = chars.find_index.with_index { |c, i| c == chars[i+1]&.swapcase }) ? (2.times { chars.delete_at(r) }) : (break) }
puts chars.count
