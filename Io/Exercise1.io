// Exercise 1:
// Run an Io program from a file. 
// > io programname.io

// Execute code in a slot given it's name

// Hello World
World := Object clone
World message := method("Hello World" println)
World message
"" println

// Create a list of the continents
World continents := list("North America", "South America", "Europe", "Asia", "Africa", "Australia", "Antarctica")
World continents
"" println

// Create a method to retrieve a continent based on index
World at := method(position, continents at(position) println)
World at(0)
World at(1)
World at(2)
World at(3)
World at(4)
World at(5)
World at(6)
"" println

"That wasn't very fun, how about a loop next time" println
for(i,0,6, World at(i))
"" println

"And now for total destruction" println
for(i, 0, 6, World continents pop println)
"The world is empty? " print
World continents isEmpty println