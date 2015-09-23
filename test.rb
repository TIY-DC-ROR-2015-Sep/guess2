require "minitest/autorun"
require "minitest/reporters"
Minitest::Reporters.use!

require "pry"

require "./game"

class GameTest < Minitest::Test
  def test_game_is_a_thing
    assert Game.is_a?(Class)
  end

  def test_games_have_a_min_and_max
    g = Game.new
    assert g.min.is_a?(Integer)
    assert g.max.is_a?(Integer)
    assert g.min < g.max
  end

  def test_games_have_guesses_to_start
    g = Game.new
    refute g.out_of_guesses?
  end

  def test_check_guess_returns_true_on_a_good_guess
    g = Game.new 5
    result = g.check_guess 5
    assert_equal true, result
  end
end
