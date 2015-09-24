class Player
  def get_guess
    gets.chomp.to_i
  end
end

class DumbAI
  def get_guess
    rand 1..50
  end
end

class SmartAI
  def initialize
    @max = 50
    @min = 1
  end

  def get_guess
    (@max + @min) / 2
  end

  def record_result result
    if result == "high"
      @max = get_guess
    elsif result == "low"
      @min = get_guess
    end
  end
end
