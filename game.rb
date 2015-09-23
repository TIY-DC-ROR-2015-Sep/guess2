class Game
  attr_reader :min, :max, :guesses_left

  def initialize answer: nil, max: nil
    @min = 1
    if max
      @max = max
    else
      @max = 10
    end
    @guesses_left = 5

    if answer
      @answer = answer
    else
      @answer = rand(@min .. @max)
    end
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
