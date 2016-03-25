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

  def test_player_one_getter
    player1 = Player.new(name: "Kyle")
    player2 = Player.new(name: "Travis")
    rps_rules = RPSRules.new(player_one: player1, player_two: player2)
    assert_equal(player1, rps_rules.player_one)
  end

  def test_player_one_setter
    player1 = Player.new(name: "Kyle")
    player2 = Player.new(name: "Travis")
    rps_rules = RPSRules.new(player_one: player1, player_two: player2)
    player3 = Player.new(name: "Jon")
    rps_rules.player_one = player3
    assert_equal(player3, rps_rules.player_one)
  end

  def test_player_two_getter
    player1 = Player.new(name: "Kyle")
    player2 = Player.new(name: "Travis")
    rps_rules = RPSRules.new(player_one: player1, player_two: player2)
    assert_equal(player2, rps_rules.player_two)
  end

  def test_player_two_setter
    player1 = Player.new(name: "Kyle")
    player2 = Player.new(name: "Travis")
    rps_rules = RPSRules.new(player_one: player1, player_two: player2)
    player3 = Player.new(name: "Jon")
    rps_rules.player_two = player3
    assert_equal(player3, rps_rules.player_two)
  end

  def test_acceptable_choices_getter
    player1 = Player.new(name: "Kyle")
    player2 = Player.new(name: "Travis")
    rps_rules = RPSRules.new(player_one: player1, player_two: player2)
    result = rps_rules.acceptable_choices
    assert_equal(['rock','paper','scissors'], result)
  end

end
