# frozen_string_literal: false

require './lib/game'

system 'clear'

puts "HANGMAN! v1.1\n\n"
puts "\nMAIN MENU:\na. Start new game.\nb. Load saved game.\nc. Delete saved game."
print "\nWhat would you like to do? Enter either 'a', 'b' or 'c': "
answer = gets.chomp

until answer[0] =~ /a/i || answer[0] =~ /b/i || answer[0] =~ /c/i
  print "You have to enter either 'a', 'b' or 'c': "
  answer = gets.chomp
end

case answer
when /a/i then player = Game.new
when /b/i
  puts "\nType 'new' to a start a new game. Else, this is the list of saved games:"
  puts Readable.saved_games
  print "\nEnter the number corresponding to the game you'd like to load: "
  player = gets.chomp

  loop do
    break unless Readable.saved_games.instance_of?(Array)

    if player =~ /new/i
      player = Game.new
      break
    elsif (1..Readable.saved_games.length).cover?(player.to_i)
      player = JSON.parse(Readable.restore_game(player.to_i), create_additions: true)
      break
    else
      puts Readable::MSG
      print 'Try again with another number: '
      player = gets.chomp
    end
  end

  player.update_word(player.tried)

when /c/i
  loop do
    break unless Readable.saved_games.instance_of?(Array)

    system 'clear'

    puts "HANGMAN! v1.1\n\n"
    puts "\nMAIN MENU:\na. Start new game.\nb. Load saved game.\nc. Delete saved game."

    puts "\nType 'new' to a start a new game. Else, this is the list of saved games:"
    puts Readable.saved_games
    print "\nEnter the number corresponding to the game you'd like to delete: "
    player = gets.chomp
    break if player =~ /new/i

    if (1..Readable.saved_games.length).cover?(player.to_i)
      Readable.delete_game(player.to_i)
      puts 'Game deleted!'
    else
      puts Readable::MSG
      print 'Try again with another number: '
      player = gets.chomp
    end
  end

  player = Game.new if player =~ /new/i
end

puts "\nStarting new game."
sleep(1)

while player.guesses < 5 && player.hidden_word.include?('_')
  system 'clear'
  puts "HANGMAN! v1.1\n\n"
  puts "Enter 'save' to save your game or 'exit' to exit the program at any time."
  puts player
  puts "#{"\n" * 1}#{"\s" * 5}#{player.show_word}#{"\s" * 5} You've tried: #{player.tried} #{"\n" * 2}"
  print 'Enter one letter you think is included in the word: '
  answer = gets.chomp

  case answer
  when /save/i
    print "\nSure! How do you want to name your file? SaveFile: "
    Readable.save_game(gets.chomp, player.to_json)
    puts 'File saved!'
  when /exit/i
    raise 'Bye! Comeback soon.'
  when /\d/ then next
  else
    begin
      player.update_word(answer[0])
    rescue TypeError
      next
    end
    unless player.hidden_word.include?('_')
      puts 'GREAT! You were correct.' \
           " The word was '#{player.show_word.split(/\s/).join}'."
      break
    end
  end
end

system 'clear'
puts "HANGMAN! v1.1\n\n"

if player.hidden_word.include?('_')
  puts "#{player}\nThe word was '#{player.word}.'"
else
  puts "Enter 'save' to save your game or 'exit' to exit the program at any time."
  puts player
  puts "#{"\n" * 1}#{"\s" * 5}#{player.show_word}#{"\s" * 5} You've tried: #{player.tried} #{"\n" * 2}"
  puts "GREAT! You were correct. The word was '#{player.show_word.split(/\s/).join}'."
end

print "If you'd like to play again enter 'a': "
system 'ruby ./lib/hangman.rb' if gets.chomp[0] =~ /a/i
