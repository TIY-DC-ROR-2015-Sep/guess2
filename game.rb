class Game
  attr_reader :min, :max, :guesses_left

  def initialize answer: nil, max: nil
    @min = 1
    @max = max || 10
    @guesses_left = 5
    @answer = answer || rand(@min .. @max)
  end

  def out_of_guesses?
    @guesses_left == 0
  end

  def check_guess guess_to_check
    if guess_to_check == @answer
      "correct"
    elsif guess_to_check > @answer
      @guesses_left -= 1
      "high"
    else
      @guesses_left -= 1
      "low"
    end
  end
end
