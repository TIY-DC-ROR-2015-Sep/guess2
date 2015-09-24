require "./game"
require "./player"

def play_game_once game, player
  loop do
    puts "You have #{game.guesses_left} guesses"
    puts "Guess a number between #{game.min} and #{game.max}"
    guess = player.get_guess
    puts "You guessed #{guess}"

    result = game.check_guess guess
    if result == "correct"
      puts "You won!"
      break
    else
      puts "Your guess was #{result}!"
    end

    if game.out_of_guesses?
      puts "You lose!"
      break
    end
    puts
  end
end

# puts "What max do you want to play to?"
# limit = gets.chomp.to_i
limit = 50

g = Game.new max: limit
# p = Player.new
p = DumbAI.new
play_game_once g, p
