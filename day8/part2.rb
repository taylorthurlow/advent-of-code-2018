#!/usr/bin/env ruby

data = File.read('data.txt').chomp.split(' ').map(&:to_i)

class Node
  attr_accessor :children, :metadata

  def initialize(children, metadata)
    @children = children
    @metadata = metadata
  end

  def value
    if @children.any?
      @metadata.map do |m|
        if m == 0
          0
        else
          child_index = m - 1
          if child_index >= 0 && child_index < @children.length
            @children[m - 1].value
          else
            0
          end
        end
      end.sum
    else
      @metadata.sum
    end
  end
end

def process(list)
  num_children = list.delete_at(0)
  num_metadata = list.delete_at(0)

  children = []
  while num_children.positive?
    children << process(list)
    num_children -= 1
  end

  metadata = list.shift(num_metadata)
  Node.new(children, metadata)
end

puts process(data).value
