# frozen_string_literal: false

require_relative 'players'

system 'clear'

puts 'Welcome to Tic Tac Toe!'
print "\nWould you like to play:\na. alone?\nb. with a friend?" \
      "\nType either 'a' or 'b': "
answer = gets.chomp

while true
  case answer[0]
  when /a/i
    player_one = Players.new
    player_two = Players.new(name: 'the Computer', mark: 'O')
    puts "\nAlright! We're good to go."
    sleep(1.5)
    break
  when /b/i
    puts "\nAlright! We're good to go." \
          "\nYou'll play as 'X' and your friend as 'O'."
    player_one = Players.new
    player_two = Players.new(name: 'your friend', mark: 'O')
    sleep(3)
    break
  else
    print "You must type either 'a' or 'b': "
    answer = gets.chomp
  end
end

round = 1

while round < 10
  system 'clear'

  case (round % 2).zero?
  when false
    puts "Round ##{round}: It's your turn to mark a cell."
    Board.update_board
    print "\nChoose a cell to mark: "
    player_one.mark_on(gets.chomp.to_i)
    if player_one.winner?
      system 'clear'
      puts "Round ##{round}: It's your turn to mark a cell."
      Board.update_board
      puts "YOU'VE WON!"
      break
    end
  when true
    puts "Round #{round}: It's #{player_two.name}'s turn to mark a cell"
    Board.update_board
    print "\nChoose a cell to mark: "
    if player_two.name == 'the Computer'
      player_two.mark_on(Players.computer_mark)
    else
      player_two.mark_on(gets.chomp.to_i)
    end
    if player_two.winner?
      system 'clear'
      puts "Round #{round}: It's #{player_two.name}'s turn to mark a cell"
      Board.update_board
      puts "#{player_two.name.upcase}'S WON!"
      break
    end
  end

  round += 1
end

print "\nWould you like to play again?\na. Yes\nb. No\n" \
      "Type either 'a' or 'b': "
answer = gets.chomp

case answer[0]
when /a/i
  puts "\nOkay! Program will reset right away..."
  sleep(1.5)
  system 'ruby tic_tac_toe.rb'
when /b/i then puts "\nOkay! Comeback soon..."
else puts "\nI'll take that as a 'No'. Comeback soon!"
end
