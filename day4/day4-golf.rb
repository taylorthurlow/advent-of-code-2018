#!/usr/bin/env ruby

require 'time'

data = File.read('data.txt').chomp.split("\n")
           .map! { |d| d.match(/\[([\d\-: ]+)\] ([ \w#]+)/).to_a }
           .sort_by! { |d| Time.parse(d[1]) }

guards = {}
recent_guard = nil

data.each do |d|
  m = d[2].match(/#(\d+)/)
  recent_guard = m[1]&.to_i if m
  guards[recent_guard] ||= {}

  date = DateTime.parse(d[1])
  guards[recent_guard][date.strftime('%m-%d')] ||= '.' * 60

  c = '#' if d[2] == 'falls asleep'
  c = '.' if d[2] == 'wakes up'
  next unless c

  guards[recent_guard][date.strftime('%m-%d')][date.minute..59] = c * (60 - date.minute)
end

# Part 1
sleepiest = guards.map { |id, s| [id, s.values.join.count('#')] }.max_by { |id, total| total }[0]
mins = (0..59).map { |m| guards[sleepiest].values.map { |s| s[m] }.join.count('#') }
puts sleepiest * mins.each_with_index.max[1]

# Part 2
soln = guards.map do |id, s|
  t = (0..59).map { |m| s.values.map { |s| s[m] }.join.count('#') }
  [id, t.each_with_index.max[1], t.max]
end

soln = soln.max_by { |s| s[2] }
p soln[0] * soln[1]
