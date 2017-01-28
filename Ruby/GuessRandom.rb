# Bonus exercise for Ruby, Day One. 
# Guess a random number between 0 and 9.
number = rand(10)

puts "=================================================="
puts ""
puts "     This is the Guess a Random Number Game!"
puts "     Can you guess what number I'm thinking?"
puts "          Hint: (It's between 0 and 9)"
puts ""
puts "=================================================="

guess = gets.to_i # convert the input to an integer

until guess == number do
    closeness = guess < number ? "higher" : "lower"
    puts "Sorry, that wasn't the number I was looking for, try something #{closeness}"
    guess = gets.to_i
end

puts "That is correct, the number I picked was #{number}!"
puts "Thanks for playing!"