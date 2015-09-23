class Game
  attr_reader :min, :max

  def initialize answer=nil
    @min = 1
    @max = 10
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
      true
    else
      false
    end
  end
end
