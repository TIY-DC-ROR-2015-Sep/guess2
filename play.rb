require "./game"
require "./player"

def play_game_once player
  # puts "What max do you want to play to?"
  # limit = gets.chomp.to_i
  limit = 50
  game = Game.new max: limit

  loop do
    puts "You have #{game.guesses_left} guesses"
    puts "Guess a number between #{game.min} and #{game.max}"
    guess = player.get_guess
    puts "You guessed #{guess}"

    result = game.check_guess guess
    player.record_result result
    if result == "correct"
      puts "You won!"
      return true
    else
      puts "Your guess was #{result}!"
    end

    if game.out_of_guesses?
      puts "You lose!"
      return false
    end
    puts
  end
end

# p = Player.new
p = SmartAI.new
play_game_once p

# count = 1
# loop do
#   player_won = play_game_once p
#   if player_won
#     puts "It took #{count} tries"
#     break
#   end
#   count += 1
# end
