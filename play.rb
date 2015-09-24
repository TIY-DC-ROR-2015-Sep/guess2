require 'pry'

require "./game"
require "./player"

def play_game_once player, limit
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

puts "What is the limit?"
limit = gets.chomp.to_i

puts "Welcome. Who is playing?"
puts "1) Human"
puts "2) Dumb AI"
puts "3) Smart AI"
selection = gets.chomp.to_i

player_class = if selection == 1
  Player
elsif selection == 2
  DumbAI
else
  SmartAI
end

player = player_class.new limit
play_game_once player, limit

# count = 1
# loop do
#   player_won = play_game_once p
#   if player_won
#     puts "It took #{count} tries"
#     break
#   end
#   count += 1
# end
