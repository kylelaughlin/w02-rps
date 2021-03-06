require 'pry'
require_relative 'rps_rules.rb'


class Game

  attr_accessor :rule_set, :player_one, :player_two

  # Constructs the initial state of a game object
  #
  # +rule_set: an object representing the rules of the game to be played
  # +player_one: an object representing the first player of the game
  # +player_two: an object representing the second player of the game
  #
  def initialize(rule_set:, player_one:, player_two:)
    @rule_set = rule_set
    @player_one = player_one
    @player_two = player_two
  end 

  # Runs the game through as many rounds as selected by the user
  #
  # Returns nil
  def play
    rounds = rounds_needed_to_win
    while @player_one.wins < rounds && @player_two.wins < rounds
      @rule_set.run_a_round
      report_end_of_round
    end
    report_end_of_game(rounds)
    @player_one.wins = 0
    @player_two.wins = 0
  end

  # Reports the number of rounds won by each player
  #
  # +rounds: an integer representing the number of rounds needed to win the match
  #
  # Returns nil
  def report_end_of_game(rounds)
    puts "\n\n##############################"
    puts "MATCH RESULTS".center(30)
    puts "\n#{@player_one.name} wins the match with #{@player_one.wins} win(s)!\n\n" if @player_one.wins == rounds
    puts "\n#{@player_two.name} wins the match with #{@player_two.wins} win(s)!\n\n" if @player_two.wins == rounds
    puts "##############################"
  end

  # Reports the current scores for each player
  #
  # Returns nil
  def report_end_of_round
    puts "\n------------------------------"
    puts "ROUND RESULTS".center(30)
    puts "\n\n#{@player_one.name} has won #{@player_one.wins}\n#{@player_two.name} has won #{player_two.wins}"
    puts "\n\n------------------------------"
  end



  # Finds how many rounds a player needs to win to win the match
  #
  # Returns an integer that represents how many rounds are needed to win
  def rounds_needed_to_win
    input = get_num_of_rounds_from_user
    valid = validate_num_of_rounds_from_user(input)
    #binding.pry
    while !valid
      puts "\nMust select a positive, odd number of rounds.\nSome one needs to win!"
      input = get_num_of_rounds_from_user
      valid = validate_num_of_rounds_from_user(input)
    end
    #math to do how many rounds a person must win
    calculate_rounds_to_win(input)
  end

  # Gets input from the user in the form of an integer
  #
  # Returns an integer representing the users input
  def get_num_of_rounds_from_user
    print "\nTo the best of how many rounds do you want to play?\n>"
    gets.chomp.to_i
  end

  # Checks if an integer is greater than zero and is odd
  #
  # +best_of: an integer representing the best of n rounds to play
  #
  # Returns true if the integer meets the criteria and false if not
  def validate_num_of_rounds_from_user(best_of)
    best_of >= 1 && best_of % 2 != 0
  end

  # Calculates how many rounds a player needs to win to win a best of n game
  #
  # +input: an integer represenging the users input of how many rounds in a best
  # => of n match
  #
  # Returns an integer representing how many rounds a player needs to win to
  # => win the match.
  def calculate_rounds_to_win(input)
    input - (input / 2)
  end

end
