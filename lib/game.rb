require 'pry'
require_relative 'rps_rules.rb'


class Game

  attr_accessor :rule_set, :player_one, :player_two

  def initialize(rule_set:, player_one:, player_two:)
    @rule_set = rule_set
    @player_one = player_one
    @player_two = player_two
  end

  #facilitate playing a game
  def play
    #Select number of players - - This may not be needed until I add in AI- assume two player for now

    #select how many rounds
      #loop the calls of the rules until a player has enough wins to break the loop
      #Report the status of wins for each players progress
    #best_of = select_how_many_rounds
    #rounds = rounds_to_win
    p1_move = player_one.player_select_choice(@rule_set.acceptable_choices)
    p2_move = player_two.player_select_choice(@rule_set.acceptable_choices)
    @rule_set.run_a_round(p1_move, p2_move)
    #while player_one.wins < rounds && player_two.wins < rounds
      #rule_set.run_a_round()
    #end

    #report the winner

  end

  def

  def rounds_to_win
    input = get_num_of_rounds_from_user
    valid = validate_num_of_rounds_from_user(input)
    #binding.pry
    while !valid
      puts "Must select a positive odd number of rounds.\nSome one needs to win!"
      input = get_num_of_rounds_from_user
      valid = validate_num_of_rounds_from_user(input)
    end
    #math to do how many rounds a person must win
    calculate = calculate_rounds_to_win(input)
  end

  def get_num_of_rounds_from_user
    puts "To the best of how many rounds do you want to play?"
    gets.chomp.to_i
  end

  def validate_num_of_rounds_from_user(best_of)
    best_of >= 1 && best_of % 2 != 0
  end

  def calculate_rounds_to_win(input)
    input - (input / 2)
  end




end
binding.pry
