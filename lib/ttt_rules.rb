require 'pry'

class TTTRules

  attr_reader :acceptable_choices
  attr_accessor :player_one, :player_two

  def initialize(player_one:, player_two:)
    @player_one = player_one
    @player_two = player_two
    @acceptable_choices = [[1,2,3],[4,5,6],[7,8,9]]
  end

  def run_a_round
  end

  def print_board(acceptable_choices)
    print " #{acceptable_choices[0][0]} | #{acceptable_choices[0][1]} | #{acceptable_choices[0][2]}"
    print "\n-----------\n"
    print " #{acceptable_choices[1][0]} | #{acceptable_choices[1][1]} | #{acceptable_choices[1][2]}"
    print "\n-----------\n"
    print " #{acceptable_choices[2][0]} | #{acceptable_choices[2][1]} | #{acceptable_choices[2][2]} \n"
  end

end
