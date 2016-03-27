require 'pry'
require_relative 'test_helper.rb'
require_relative '../lib/ai_player.rb'
require_relative '../lib/rps_rules.rb'
require_relative '../lib/game.rb'

class AIPlayerTest < Minitest::Test

  def test_ai_player_object_creation_under_normal_circumstances
    ai_player = AIPlayer.new(name: "Computer")
    refute_nil(ai_player)
  end

  def test_name_getter
    ai_player = AIPlayer.new(name: "Computer")
    assert_equal("Computer", ai_player.name)
  end

  def test_name_setter
    ai_player = AIPlayer.new(name: "Computer")
    ai_player.name = "player"
    assert_equal("player", ai_player.name)
  end

  def test_move_getter
    ai_player = AIPlayer.new(name: "Computer")
    assert_nil(ai_player.move)
  end

  def test_move_setter
    ai_player = AIPlayer.new(name: "Computer")
    ai_player.move = "rock"
    assert_equal("rock", ai_player.move)
  end

  def test_wins_getter
    ai_player = AIPlayer.new(name: "Computer")
    assert_equal(0, ai_player.wins)
  end

  def test_wins_setter
    ai_player = AIPlayer.new(name: "Computer")
    ai_player.wins = 1
    assert_equal(1, ai_player.wins)
  end

  def test_wins_round_method
    ai_player = AIPlayer.new(name: "Computer")
    assert_equal(0, ai_player.wins)
    ai_player.wins_round
    assert_equal(1, ai_player.wins)
  end

  def test_select_choice
    ai_player1 = AIPlayer.new(name: "Computer1")
    ai_player2 = AIPlayer.new(name: "Computer2")
    rules = RPSRules.new(player_one: ai_player1, player_two: ai_player2)
    game = Game.new(rule_set: rules, player_one: ai_player1, player_two: ai_player2)
    assert_nil(ai_player1.move)
    ai_player1.select_choice(rules)
    assert_includes(['rock','paper','scissors'],ai_player1.move)
  end

end
