require_relative 'test_helper.rb'
require_relative '../lib/game.rb'
require_relative '../lib/player.rb'
require_relative '../lib/rps_rules.rb'

class GameTest < Minitest::Test

  def test_create_game_under_normal_circumstances
    player1 = Player.new(name: "Kyle")
    player2 = Player.new(name: "Travis")
    rps_rules = RPSRules.new(player_one: player1, player_two: player2)
    game = Game.new(rule_set: rps_rules, player_one: player1, player_two: player2)
    refute_nil(game)
  end

  def test_rule_set_getter
    player1 = Player.new(name: "Kyle")
    player2 = Player.new(name: "Travis")
    rps_rules = RPSRules.new(player_one: player1, player_two: player2)
    game = Game.new(rule_set: rps_rules, player_one: player1, player_two: player2)
    assert_equal(rps_rules, game.rule_set)
  end

  def test_rule_set_setter
    player1 = Player.new(name: "Kyle")
    player2 = Player.new(name: "Travis")
    rps_rules = RPSRules.new(player_one: player1, player_two: player2)
    other_rps_rules = RPSRules.new(player_one: player1, player_two: player2)
    game = Game.new(rule_set: rps_rules, player_one: player1, player_two: player2)
    game.rule_set = other_rps_rules
    assert_equal(other_rps_rules, game.rule_set)
  end

  def test_player_one_getter
    player1 = Player.new(name: "Kyle")
    player2 = Player.new(name: "Travis")
    rps_rules = RPSRules.new(player_one: player1, player_two: player2)
    game = Game.new(rule_set: rps_rules, player_one: player1, player_two: player2)
    assert_equal(player1, game.player_one)
  end

  def test_player_one_setter
    player1 = Player.new(name: "Kyle")
    player2 = Player.new(name: "Travis")
    rps_rules = RPSRules.new(player_one: player1, player_two: player2)
    game = Game.new(rule_set: rps_rules, player_one: player1, player_two: player2)
    assert_equal(player1, game.player_one)
    player3 = Player.new(name: "Andrea")
    game.player_one = player3
    assert_equal(player3, game.player_one)
  end

  def test_player_two_getter
    player1 = Player.new(name: "Kyle")
    player2 = Player.new(name: "Travis")
    rps_rules = RPSRules.new(player_one: player1, player_two: player2)
    game = Game.new(rule_set: rps_rules, player_one: player1, player_two: player2)
    assert_equal(player2, game.player_two)
  end

  def test_player_two_setter
    player1 = Player.new(name: "Kyle")
    player2 = Player.new(name: "Travis")
    rps_rules = RPSRules.new(player_one: player1, player_two: player2)
    game = Game.new(rule_set: rps_rules, player_one: player1, player_two: player2)
    assert_equal(player2, game.player_two)
    player3 = Player.new(name: "Andrea")
    game.player_two = player3
    assert_equal(player3, game.player_two)
  end

end
