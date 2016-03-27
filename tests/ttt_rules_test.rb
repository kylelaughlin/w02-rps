require_relative "test_helper.rb"
require_relative "../lib/ttt_rules.rb"
require_relative "../lib/player.rb"

class TTTRulesTest < Minitest::Test

  def test_creation_of_ttt_rules_object_normal_circumstances
    player1 = Player.new(name: "Kyle")
    player2 = Player.new(name: "Travis")
    rule_set = TTTRules.new(player_one: player1, player_two: player2)
    refute_nil(rule_set)
  end

  def test_player_one_getter
    player1 = Player.new(name: "Kyle")
    player2 = Player.new(name: "Travis")
    rule_set = TTTRules.new(player_one: player1, player_two: player2)
    assert_equal(player1, rule_set.player_one)
  end

  def test_player_one_setter
    player1 = Player.new(name: "Kyle")
    player2 = Player.new(name: "Travis")
    rule_set = TTTRules.new(player_one: player1, player_two: player2)
    assert_equal(player1, rule_set.player_one)
    player3 = Player.new(name: "Andrea")
    rule_set.player_one = player3
    assert_equal(player3, rule_set.player_one)
  end

  def test_player_two_getter
    player1 = Player.new(name: "Kyle")
    player2 = Player.new(name: "Travis")
    rule_set = TTTRules.new(player_one: player1, player_two: player2)
    assert_equal(player2, rule_set.player_two)
  end

  def test_player_two_setter
    player1 = Player.new(name: "Kyle")
    player2 = Player.new(name: "Travis")
    rule_set = TTTRules.new(player_one: player1, player_two: player2)
    assert_equal(player2, rule_set.player_two)
    player3 = Player.new(name: "Andrea")
    rule_set.player_two = player3
    assert_equal(player3, rule_set.player_two)
  end

  def test_acceptable_choices_getter
    player1 = Player.new(name: "Kyle")
    player2 = Player.new(name: "Travis")
    rule_set = TTTRules.new(player_one: player1, player_two: player2)
    result = rule_set.acceptable_choices
    assert_equal([[1,2,3],[4,5,6],[7,8,9]], result)
  end

  def test_board_printing
    player1 = Player.new(name: "Kyle")
    player2 = Player.new(name: "Travis")
    rule_set = TTTRules.new(player_one: player1, player_two: player2)
    result = rule_set.print_board
    string = " 1 | 2 | 3\n-----------\n 4 | 5 | 6\n-----------\n 7 | 8 | 9 \n"
    assert_equal(string, result)
  end
  
end
