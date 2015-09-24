require "./game"
require "./player"

puts "What max do you want to play to?"
limit = gets.chomp.to_i

g = Game.new max: limit
p = Player.new

loop do
  puts "You have #{g.guesses_left} guesses"
  puts "Guess a number between #{g.min} and #{g.max}"
  guess = p.get_guess

  result = g.check_guess guess
  if result == "correct"
    puts "You won!"
    break
  else
    puts "Your guess was #{result}!"
  end

  if g.out_of_guesses?
    puts "You lose!"
    break
  end
end
