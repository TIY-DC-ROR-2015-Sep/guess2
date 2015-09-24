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
