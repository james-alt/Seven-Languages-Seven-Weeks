# Examples from the book on the inject method

a = [5 , 3, 4, 1]

val1 = a.inject(0) {|sum, i| sum + i}       # 13
val2 = a.inject {|sum, i| sum + i}          # 13
val3 = a.inject {|product, i| product * i } # 60

puts "a.inject(0) {|sum, i| sum + i}       => #{val1}"
puts "a.inject {|sum, i| sum + i}          => #{val2}"
puts "a.inject {|product, i| product * i } => #{val3}"

puts ""
a.inject(0) do |sum, i|
    puts "sum: #{sum}   i: #{i}    sum + i: #{sum + i}"
    sum + i
end