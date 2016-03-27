require 'pry'
require_relative 'test_helper.rb'
require_relative '../lib/ai_player.rb'

class AIPlayerTest < Minitest::Test

  def test_ai_player_object_creation_under_normal_circumstances
    ai_player = AIPlayer.new(name: "Computer")
    refute_nil(ai_player)
  end

  def test_name_getter
    ai_player = AIPlayer.new(name: "Computer")
    assert_equal("Computer", ai_player.name)
  end
  
end