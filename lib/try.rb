require 'pry'
require_relative 'player.rb'
require_relative 'ttt_rules.rb'

player1 = Player.new(name:"Kyle")
player2 = Player.new(name:"Andrea")

rule_set = TTTRules.new(player_one: player1, player_two:player2)

binding.pry
rule_set.run_a_round
