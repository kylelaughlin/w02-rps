require 'pry'

class Player

  attr_accessor :name, :move, :wins

  def initialize(name:)
    @name = name
    @move  = nil
    @wins = nil
  end

  acceptable_choices = ['rock', 'paper', 'scissors']
  def player_select_choice(acceptable_choices)
    puts "Please select one of the following:"
    acceptable_choices.each { |e| puts e}
    player_choice = gets.chomp.downcase
    while !acceptable_choices.include? player_choice
      puts "\n\n'#{player_choice}' is not a valid option. Please select one of the following:"
      acceptable_choices.each { |e| puts e}
      player_choice = gets.chomp.downcase
    end
    player_choice
  end

  def player_input
    player_choice = gets.chomp.downcase
    input_validity(player_choice)
  end

  def input_validity(player_choice, acceptable_choices)
    while !acceptable_choices.include? player_choice
      puts "\n\n'#{player_choice}' is not a valid option. Please select on of the following:"
      acceptable_choices.each { |e| puts e}
      player_choice = gets.chomp.downcase
    end
  end

end
