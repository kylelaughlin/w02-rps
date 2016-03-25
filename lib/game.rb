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
    best_of = select_how_many_rounds

    #report the winner

  end

  def get_num_of_rounds_from_user
    puts "To the best of how many rounds do you want to play?"
    gets.chomp.to_i
  end

  def select_how_many_rounds(input)

=begin
    puts "To the best of how many rounds do you want to play?"
    best_of = get_num_of_rounds_from_user
    valid? = validate_num_of_rounds_from_user
    while !valid?
      print "Can not play #{best_of} rounds. Please select again: "
      best_of = get_num_of_rounds_from_user
      valid? = validate_num_of_rounds_from_user
    end
    best_of
=end
  end

  def rounds
    input = get_num_of_rounds_from_user
    valid = validate_num_of_rounds_from_user(input)
    while !valid
      puts "Must select a positive odd number of rounds.\nSome one needs to win!"
      rounds
    end
    #math to do how many rounds a person must win

  end

  def validate_num_of_rounds_from_user(best_of)
    best_of >= 1 && best_of % 2 != 0
  end



end