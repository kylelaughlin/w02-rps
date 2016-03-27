require_relative 'test_helper.rb'
require_relative '../lib/rps_rules.rb'
require_relative '../lib/player.rb'
require_relative '../lib/ai_player.rb'

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

  def test_determine_winner_tie
    player1 = Player.new(name: "Kyle")
    player2 = Player.new(name: "Travis")
    player1.move = 'rock'
    rps_rules = RPSRules.new(player_one: player1, player_two: player2)
    result = rps_rules.determine_winner('rock','rock')
    assert_equal("\nThis round was a tie. You both chose '#{player1.move}'",result)
  end

  def test_determine_winner_player_one_wins
    player1 = Player.new(name: "Kyle")
    player2 = Player.new(name: "Travis")
    rps_rules = RPSRules.new(player_one: player1, player_two: player2)
    result = rps_rules.determine_winner('rock','scissors')
    assert_equal("\nKyle won this round!",result)
  end

  def test_determine_winner_player_two_wins
    player1 = Player.new(name: "Kyle")
    player2 = Player.new(name: "Travis")
    rps_rules = RPSRules.new(player_one: player1, player_two: player2)
    result = rps_rules.determine_winner('rock','paper')
    assert_equal("\nTravis won this round!",result)
  end

  def test_ai_selection
    player1 = AIPlayer.new(name: "Kyle")
    player2 = Player.new(name: "Travis")
    rps_rules = RPSRules.new(player_one: player1, player_two: player2)
    result = rps_rules.ai_selection
    assert_includes(['rock','paper','scissors'],result,"Should be valid.")
  end

end
