# STRING
puts "STRING"
puts "The length of `racecar` is #{"racecar".length}"

puts "The reverse of `racecar` is #{"racecar".reverse}"

s = "racecar"
puts "racecar is #{s == s.reverse ? "equals" : "not equals"}" +
  " with racecar.reverse"

puts "It's a palindrome!" if s == s.reverse
puts

# METHOD
puts "METHOD"
def palindrome_tester(s)
  if s == s.reverse
    puts "It's a palindrome!"
  else
    puts "It's not a palindrome!"
  end
end

palindrome_tester("racecar")
palindrome_tester("onomatopoeia")

print "nil!" if palindrome_tester("racecar").nil?
puts
puts

# ARRAYS AND RANGES
puts "ARRAYS AND RANGES"
puts a = "A man, a plan, a canal, Panama".split(",")
puts s = a.join

s = s.split(" ").join
palindrome_tester(s)
palindrome_tester(s.downcase)

puts ('a'..'z').to_a[7]
puts

# BLOCK
puts "BLOCK"

(0..16).each do {|i| puts 2 ^ i}
