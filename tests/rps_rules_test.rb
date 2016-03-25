require_relative 'test_helper.rb'
require_relative '../lib/rps_rules.rb'
require_relative '../lib/player.rb'

class RPSRulesTest < Minitest::Test

  def test_rps_rules_object_created_under_normal_circumstances
    player1 = Player.new(name: "Kyle")
    player2 = Player.new(name: "Travis")
    rps_rules = RPSRules.new(player_one: player1, player_two: player2)
    refute_nil(rps_rules)
  end

end
