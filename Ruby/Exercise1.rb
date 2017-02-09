# These are the first exercises in the language. Meant to just be run using 'irb'
# The final exercise is to run a Ruby program from a file, so I've moved everything
# into a file.

# Print Hello, world.
puts "Hello, world."

# Find the index of the word Ruby in the string Hello, Ruby.
index = "Hello, Ruby.".index('Ruby');
puts "In the string \"Hello, Ruby.\", the word \"Ruby\" is located at index #{index}"

# Print my name 10 times.
puts "[for loop]"
for i in 1..10
    puts "James"
end

puts "[while loop]"
i = 0
while i < 10
    puts "James"
    i += 1
end

puts "[until loop]"
i = 0
until i > 9
    puts "James"
    i += 1
end 

# Print the string "This is sentence number 1" where the number 1 changes from 1 to 10
10.times { |x| puts "This is sentence number #{x+1}"}