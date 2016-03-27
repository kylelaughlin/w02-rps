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
    assert_equal([["1","2","3"],["4","5","6"],["7","8","9"]], result)
  end

  def test_board_getter
    player1 = Player.new(name: "Kyle")
    player2 = Player.new(name: "Travis")
    rule_set = TTTRules.new(player_one: player1, player_two: player2)
    assert_equal([["1","2","3"],["4","5","6"],["7","8","9"]],rule_set.board)
  end

  def test_board_setter
    player1 = Player.new(name: "Kyle")
    player2 = Player.new(name: "Travis")
    rule_set = TTTRules.new(player_one: player1, player_two: player2)
    assert_equal([["1","2","3"],["4","5","6"],["7","8","9"]],rule_set.board)
    rule_set.board = [["1","2","3"],["X","X","X"],["7","8","9"]]
    assert_equal([["1","2","3"],["X","X","X"],["7","8","9"]],rule_set.board)
  end

  def test_board_printing
    player1 = Player.new(name: "Kyle")
    player2 = Player.new(name: "Travis")
    rule_set = TTTRules.new(player_one: player1, player_two: player2)
    result = rule_set.build_board
    string = " 1 | 2 | 3\n-----------\n 4 | 5 | 6\n-----------\n 7 | 8 | 9 \n"
    assert_equal(string, result)
  end

  def test_valid_choice_passing
    player1 = Player.new(name: "Kyle")
    player2 = Player.new(name: "Travis")
    rule_set = TTTRules.new(player_one: player1, player_two: player2)
    result = rule_set.valid?("4")
    assert(result, "Should be a valid tic-tac-toe selection")
  end

  def test_valid_choice_failing
    player1 = Player.new(name: "Kyle")
    player2 = Player.new(name: "Travis")
    rule_set = TTTRules.new(player_one: player1, player_two: player2)
    result = rule_set.valid?(0)
    refute(result, "0 Should not an invalid tic-tac-toe selection")
  end

  def test_determine_winner_player_one_wins
    player1 = Player.new(name: "Kyle")
    player2 = Player.new(name: "Travis")
    rule_set = TTTRules.new(player_one: player1, player_two: player2)
    assert_equal(0,player1.wins)
    rule_set.player_wins(player1)
    assert_equal(1,player1.wins)
  end

  def test_check_for_wins_across_win
    player1 = Player.new(name: "Kyle")
    player2 = Player.new(name: "Travis")
    rule_set = TTTRules.new(player_one: player1, player_two: player2)
    rule_set.board = [[1,2,3],["X","X","X"],[7,8,9]]
    result = rule_set.check_for_win(player1,"X")
    assert(result,"Should be valid as there is a winning board")
  end

  def test_tie_game_true
    player1 = Player.new(name: "Kyle")
    player2 = Player.new(name: "Travis")
    rule_set = TTTRules.new(player_one: player1, player_two: player2)
    rule_set.acceptable_choices = [[],[],[]]
    assert(rule_set.tie_game)
  end

  def test_tie_game_false
    player1 = Player.new(name: "Kyle")
    player2 = Player.new(name: "Travis")
    rule_set = TTTRules.new(player_one: player1, player_two: player2)
    rule_set.acceptable_choices = [[],[5],[]]
    refute(rule_set.tie_game)
  end

  def test_ai_selection
    player1 = Player.new(name: "Kyle")
    player2 = Player.new(name: "Travis")
    rule_set = TTTRules.new(player_one: player1, player_two: player2)
    rule_set.acceptable_choices = [["1","2"],[],["9"]]
    result = rule_set.ai_selection
    assert_includes(["1","2","9"],result)
  end

  def test_reset_of_acceptable_choices
    player1 = Player.new(name: "Kyle")
    player2 = Player.new(name: "Travis")
    rule_set = TTTRules.new(player_one: player1, player_two: player2)
    rule_set.acceptable_choices = [["1","2"],[],["9"]]
    assert_equal([["1","2"],[],["9"]],rule_set.acceptable_choices)
    rule_set.reset_acceptable_choices
    assert_equal([["1","2","3"],["4","5","6"],["7","8","9"]],rule_set.acceptable_choices)
  end

  def test_reset_of_board
    player1 = Player.new(name: "Kyle")
    player2 = Player.new(name: "Travis")
    rule_set = TTTRules.new(player_one: player1, player_two: player2)
    rule_set.board = [["X","2","X"],["4","O","O"],["X","O","9"]]
    assert_equal([["X","2","X"],["4","O","O"],["X","O","9"]],rule_set.board)
    rule_set.reset_board
    assert_equal([["1","2","3"],["4","5","6"],["7","8","9"]],rule_set.board)
  end

end
