
class SmartAI
  def initialize limit
    @max = limit
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

class Player < SmartAI
  def get_guess
    gets.chomp.to_i
  end

  def record_result _
  end
end

class DumbAI < SmartAI
  def get_guess
    rand 1..50
  end
end
