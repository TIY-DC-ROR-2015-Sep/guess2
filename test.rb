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
    assert_equal 5, g.guesses_left
  end

  def test_check_guess_returns_correct_on_a_good_guess
    g = Game.new 5
    result = g.check_guess 5
    assert_equal "correct", result
  end

  def test_check_gives_feedback
    g = Game.new 7
    result = g.check_guess 9
    assert_equal "high", result

    result = g.check_guess 4
    assert_equal "low", result
  end

  def test_can_run_out_of_guesses
    g = Game.new 2
    5.times do
      g.check_guess 1
    end
    assert g.out_of_guesses?
    assert_equal 0, g.guesses_left
  end
end
