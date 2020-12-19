# frozen_string_literal: false

require './lib/game'

system 'clear'

puts "HANGMAN! v1.0\n\n"
puts "\nMAIN MENU:\na. Start new game.\nb. Load saved game."
print "\nWhat would you like to do? Enter either 'a' or 'b': "
answer = gets.chomp

until answer[0] =~ /a/i || answer[0] =~ /b/i
  print "You have enter either 'a' or 'b': "
  answer = gets.chomp
end

case answer
when /a/i
  player = Game.new
when /b/i
  puts "\nThis is the list of saved games:"
  puts Readable.saved_games
  print "\nEnter the number corresponding to the game you'd like to load: "
  player = gets.chomp.to_i

  loop do
    if (0..Readable.saved_games.length - 1).cover?(player)
      player = JSON.parse(Readable.restore_game(player), create_additions: true)
      break
    else
      puts Readable::MSG
      print 'Try again with another number: '
      player = gets.chomp.to_i
    end
  end
  player.update_word(player.tried)
end

puts "\nAlright! Game will start momentarily."
sleep(1)

while player.guesses < 5 && player.hidden_word.include?('_')
  system 'clear'
  puts "HANGMAN! v1.0\n\n"
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
    player.update_word(answer[0])
    unless player.hidden_word.include?('_')
      puts "\nGREAT! You were correct." \
           " The word was '#{player.show_word.split(/\s/).join}'."
      break
    end
  end

  sleep(0.5)
end

if player.hidden_word.include?('_')
  system 'clear'
  puts "HANGMAN! v1.0\n\n"
  puts "#{player} The word was '#{player.word}.'"
end

print "If you'd like to play again enter 'a': "
system 'ruby ./lib/hangman.rb' if gets.chomp =~ /a/i
