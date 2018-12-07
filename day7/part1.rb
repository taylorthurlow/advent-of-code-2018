#!/usr/bin/env ruby

require 'pqueue'

data = File.read('data.txt').chomp.split("\n").map{ |d| d.match(/Step ([A-Z])[a-z ]+([A-Z])/)[1..2] }

class Node
  attr_accessor :val, :children

  def initialize(val)
    @val = val
    @children = []
  end
end

nodes = []
data.each do |before, after|
  added = nodes.map(&:val)
  nodes << Node.new(before) unless added.include? before
  nodes << Node.new(after) unless added.include? after

  before = nodes.find { |n| n.val == before }
  after = nodes.find { |n| n.val == after }

  before.children << after unless before.children.include? after
end

list = []
roots = nodes.reject { |n| nodes.any? { |n2| n2.children.include? n } }.sort_by(&:val)
s = PQueue.new(roots) { |a, b| a.val < b.val }
p s.to_a.map(&:val).join

until s.empty?
  n = s.pop
  list << n

  n.children.sort_by(&:val).each do |c|
    n.children.delete(c)
    s << c unless nodes.any? { |n2| n2.children.include? c }
  end
end

p list.map(&:val).join
