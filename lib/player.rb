require 'pry'

class Player

  attr_accessor :name, :move, :wins

  def initialize(name:)
    @name = name
    @move  = nil
    @wins = nil
  end

  acceptable_choices = ['rock', 'paper', 'scissors']

  # Prompts the user for their choice for a round
  #
  # +acceptable_choices: an array representing the allowable selections for a player to make
  #
  # Returns a string representing the choice the player has made
  def player_select_choice(acceptable_choices)
    puts "Please select one of the following:"
    acceptable_choices.each { |e| puts e}
    player_choice = gets.chomp.downcase
    player_choice = input_validity(player_choice, acceptable_choices)
  end

  # Checks the validity of the players choice

  def input_validity(player_choice, acceptable_choices)
    while !acceptable_choices.include? player_choice
      puts "\n\n'#{player_choice}' is not a valid option."
      player_select_choice(acceptable_choices)
    end
    player_choice
  end

end

binding.pry
