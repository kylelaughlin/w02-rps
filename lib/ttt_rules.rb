require 'pry'
require_relative 'player.rb'

class TTTRules

  attr_accessor :player_one, :player_two, :board, :acceptable_choices

  # Construct the initial state of the TTTRules object
  #
  # +player_one: a player object representing the first player
  # +player_two: a player object representing the second player
  #
  def initialize(player_one:, player_two:)
    @player_one = player_one
    @player_two = player_two
    @acceptable_choices = [["1","2","3"],["4","5","6"],["7","8","9"]]
    @board = [["1","2","3"],["4","5","6"],["7","8","9"]]
  end

  # Resets the acceptable_choices array to start a fresh round
  #
  # Returns the reset acceptable_choices array
  def reset_acceptable_choices
    self.acceptable_choices = [["1","2","3"],["4","5","6"],["7","8","9"]]
  end

  # Resets the board array to start a fresh round
  #
  # Returns the reset board array
  def reset_board
    self.board = [["1","2","3"],["4","5","6"],["7","8","9"]]
  end

  # Runs one round of tic-tac-toe resulting in a winner or a tie
  #
  # Returns nil
  def run_a_round
    reset_acceptable_choices
    reset_board
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

  # Checks if there are any more available moves- indicates a tie game
  #
  # Returns true if there are no more moves, otherwise false
  def tie_game
    @acceptable_choices[0].empty? &&
    @acceptable_choices[1].empty? &&
    @acceptable_choices[2].empty?
  end

  # Creates a string that represents a graphical representation of the build_board
  #
  # Returns the created string representing the tic-tac-toe board
  def build_board
    board = " #{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]}"
    board += "\n-----------\n"
    board += " #{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]}"
    board += "\n-----------\n"
    board += " #{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]} \n"
  end

  # Prompts the user for their selection, showing them the board
  #
  # +player: represents the player object whose turn it is
  # +symbol: a string representing an "X" or an "O" to play on the board
  #
  # Returns nil
  def player_selection(player, symbol)
    puts "#{player.name}, it's your turn\n\n"
    puts build_board
    choice = player.select_choice(self)
    #remove from acceptable_choices
    remove_played_space_from_acceptable_choices(choice)
    #update board
    update_board(choice, symbol)
  end

  # Checks to see if a users selected move is a valid space to play
  #
  # +choice: a string representing the space the user has selected to play
  #
  # Returns true if the users choice is a valid move, otherwise false
  def valid?(choice)
    @acceptable_choices[0].include?(choice) ||
    @acceptable_choices[1].include?(choice) ||
    @acceptable_choices[2].include?(choice)
  end

  # Removes a space from acceptable_choices once a player plays that space
  #
  # +choice: a string representing the space the user has selected to play
  #
  # Returns nil
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

  # Changes out a board spaces numerical place holder with the players symbol X or O
  #
  # +choice: a string representing the space the user has selected to play
  # +symbol: a string representing an "X" or an "O" to play on the board
  #
  # Returns nil
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

  # Checks all possible ways inwhich a player may win with three in a row
  #
  # +player: represents the player object whose turn it is
  # +symbol: a string representing an "X" or an "O" to play on the board
  #
  # Returns true if a player has won, otherwise false
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

  # Calls the player.wins_round method and puts to console
  #
  # +player: represents the player object whose turn it is
  #
  # Returns nil
  def player_wins(player)
    player.wins_round
    puts "\n#{player.name} won the round!\n"
  end

  # Picks a random space for the AI player's move
  #
  # Returns a string representing the numerical place holder for an available space
  def ai_selection
    valid_rows = []
    valid_choices = []
    (0..2).each do |i|
      valid_rows << i if !@acceptable_choices[i].empty?
    end
    valid_rows.each do |e|
      valid_choices << @acceptable_choices[e]
    end
    valid_choices.flatten.sample
  end


end
