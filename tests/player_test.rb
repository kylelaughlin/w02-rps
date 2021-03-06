require 'pry'
require_relative 'test_helper.rb'
require_relative '../lib/player.rb'

class PlayerTest < Minitest::Test

  def test_player_object_creation_under_normal_circumstance
    player = Player.new(name: "Kyle")
    refute_nil(player)
  end

  def test_name_getter
    player = Player.new(name: "Kyle")
    assert_equal("Kyle", player.name)
  end

  def test_name_setter
    player = Player.new(name: "Kyle")
    player.name = "Fred"
    assert_equal("Fred", player.name)
  end

  def test_move_getter_and_setter
    player = Player.new(name: "Kyle")
    assert_nil(player.move)
    player.move = "rock"
    assert_equal("rock", player.move)
  end

  def test_wins_getter_and_setter
    player = Player.new(name: "Kyle")
    assert_equal(0, player.wins)
    player.wins = 5
    assert_equal(5, player.wins)
  end

  def test_wins_a_game
    player = Player.new(name: "Kyle")
    assert_equal(0, player.wins)
    player.wins_round
    assert_equal(1, player.wins)
  end

end
