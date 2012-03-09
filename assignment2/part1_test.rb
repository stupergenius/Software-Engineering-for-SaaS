load 'part1.rb'

puts "string palindrome"
puts "racecar".palindrome? == true
puts "foobar".palindrome? == false

puts "enumerable palindrome"
puts [1,2,3,2,1].palindrome? == true
puts [1,2,3,2,2,1].palindrome? == false
h = {"one"=>1, "two"=>2}
puts h.palindrome? == false