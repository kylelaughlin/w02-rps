require 'pry'

class TTTRules

  attr_reader :acceptable_choices
  attr_accessor :player_one, :player_two

  def initialize(player_one:, player_two:)
    @player_one = player_one
    @player_two = player_two
    @acceptable_choices = [ 'Top Left',
                            'Top Center',
                            'Top Right',
                            'Middle Left',
                            'Middle Center',
                            'Middle Right',
                            'Bottom Left',
                            'Bottom Center',
                            'Bottom Right'
                          ]
  end

  

end
