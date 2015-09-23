class Game
  attr_reader :min, :max

  def initialize
    @min = 1
    @max = 10
    @guesses_left = 5
  end

  def out_of_guesses?
    @guesses_left == 0
  end
end
