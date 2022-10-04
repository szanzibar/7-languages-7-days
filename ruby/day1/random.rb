max = 1000
random = rand(max) + 1
puts "Guess a number between 1 and #{max}"
loop do
    guess = gets.chomp.to_i

    puts "too high! Guess again" if guess > random
    puts "too low! Guess again" if guess < random

    break if guess == random 
end

puts "you got it! The answer was #{random}"