#!/usr/bin/ruby -w

#1
puts "#1 is Hello, World"

#2
idx = "Hello, World".index('World')
puts "#2 is #{idx}"

#3-4
i = 0
while i < 10
  puts "#3-4 is #{i}"
  i += 1
end

#5
answer = rand(10)
puts 'enter your number'
player_answer = gets.to_i

while player_answer.to_i != answer
  if player_answer > answer
    puts 'your number greater than answer'
  else
    puts 'your number lower than answer'
  end
  player_answer = gets.to_i
end
puts "You're God damn right"

