require "minitest/autorun"
require "minitest/reporters"
Minitest::Reporters.use!

require "pry"

require "./game"

class GameTest < Minitest::Test
  def test_game_is_a_thing
    assert Game.is_a?(Class)
  end
end
