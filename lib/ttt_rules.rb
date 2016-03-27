require 'pry'
require_relative 'player.rb'

class TTTRules

  attr_accessor :player_one, :player_two, :board, :acceptable_choices

  def initialize(player_one:, player_two:)
    @player_one = player_one
    @player_two = player_two
    @acceptable_choices = [["1","2","3"],["4","5","6"],["7","8","9"]]
    @board = [["1","2","3"],["4","5","6"],["7","8","9"]]
  end

  def reset_acceptable_choices
    self.acceptable_choices = [["1","2","3"],["4","5","6"],["7","8","9"]]
    self.board = [["1","2","3"],["4","5","6"],["7","8","9"]]
  end

  def run_a_round
    reset_acceptable_choices
    binding.pry
    while !tie_game
      #player_ones turn
      player_selection(@player_one,"X")
      #check for a player one win
      break if check_for_win(@player_one,"X")
      break if tie_game
      #player_twos turn
      player_selection(@player_two,"O")
      #check for a player two win
      break if check_for_win(@player_two,"O")
    end
  end

  def tie_game
    @acceptable_choices[0].empty? &&
    @acceptable_choices[1].empty? &&
    @acceptable_choices[2].empty?
  end

  def build_board
    board = " #{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]}"
    board += "\n-----------\n"
    board += " #{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]}"
    board += "\n-----------\n"
    board += " #{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]} \n"
  end

  def player_selection(player, symbol)
    puts "#{player.name}, it's your turn\n\n"
    puts build_board
    choice = player.select_choice(self)
    #remove from acceptable_choices
    remove_played_space_from_acceptable_choices(choice)
    #update board
    update_board(choice, symbol)
  end

  def valid?(choice)
    @acceptable_choices[0].include?(choice) ||
    @acceptable_choices[1].include?(choice) ||
    @acceptable_choices[2].include?(choice)
  end

  def remove_played_space_from_acceptable_choices(choice)
    if @acceptable_choices[0].include? choice
      @acceptable_choices[0].delete(choice)
    elsif @acceptable_choices[1].include? choice
      @acceptable_choices[1].delete(choice)
    elsif @acceptable_choices[2].include? choice
      @acceptable_choices[2].delete(choice)
    else
      puts "Something weird happened when removing choice from array"
    end
  end

  def update_board(choice, symbol)
    if @board[0].include? choice
      @board[0].map! {|e| e == choice ? symbol : e}
    elsif @board[1].include? choice
      @board[1].map! {|e| e == choice ? symbol : e}
    elsif @board[2].include? choice
      @board[2].map! {|e| e == choice ? symbol : e}
    else
      puts "Something weird happened when replacing board spaces"
    end
  end

  def check_for_win(player, symbol)
    win = @board[0] == [symbol,symbol,symbol] ||
          @board[1] == [symbol,symbol,symbol] ||
          @board[2] == [symbol,symbol,symbol] ||
          @board[0][0] == symbol && @board[1][0] == symbol && @board[2][0] == symbol ||
          @board[0][1] == symbol && @board[1][1] == symbol && @board[2][1] == symbol ||
          @board[0][2] == symbol && @board[1][2] == symbol && @board[2][2] == symbol ||
          @board[0][0] == symbol && @board[1][1] == symbol && @board[2][2] == symbol ||
          @board[2][0] == symbol && @board[1][1] == symbol && @board[0][2] == symbol
    player_wins(player) if win
    win
  end

  def player_wins(player)
    player.wins_round
    puts "\n#{player.name} won the round!\n"
  end
end
