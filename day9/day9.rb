#!/usr/bin/env ruby

class Marble
  attr_accessor :value, :p, :n

  def initialize(value)
    @value = value
    @p = self
    @n = self
  end
end

player_count = 439
last_marble = 71307 * 100

players = Hash.new(0)
pile = (1..last_marble).to_a.map { |v| Marble.new(v) }
current_marble = Marble.new(0)
current_player = 1

until pile.empty?
  new_marble = pile.shift

  if new_marble.value % 23 == 0
    players[current_player] += new_marble.value
    7.times { current_marble = current_marble.p }
    a = current_marble.p
    b = current_marble.n
    a.n = b
    b.p = a
    players[current_player] += current_marble.value

    current_marble = b
  else
    current_marble = current_marble.n
    t = current_marble.n
    current_marble.n = new_marble
    new_marble.n = t
    new_marble.p = current_marble
    t.p = new_marble

    current_marble = new_marble
  end

  current_player += 1
  current_player = 1 if current_player > player_count
end

puts players.values.max
