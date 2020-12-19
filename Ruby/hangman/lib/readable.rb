# frozen_string_literal: false

# I/O methods
module Readable
  module_function

  MSG = "\nNo saved games found matching search criteria.".freeze

  def extract_word
    file = Readable.save_word_list
    file[rand(file.length)].split(/\W/).join
  end

  def save_word_list
    file = File.readlines 'words.txt'
    file.select do |e|
      e = e.split(/\W/).join
      e.length >= 5 && e.length <= 12
    end
  end

  def save_game(file_name, string)
    Dir.mkdir('saves') unless Dir.exist?('saves')

    file = "./saves/#{Dir.children('./saves').length}_#{file_name}"

    File.open(file, 'a') do |e|
      e.print string
    end
  end

  def restore_game(file_num)
    return Readable::MSG unless Dir.exist?('saves')

    File.read "./saves/#{find_saved_game(file_num)}"
  end

  def find_saved_game(file_num)
    regexp = Regexp.new("#{file_num}_\\w")
    saved_games.each do |e|
      return e if e.match?(regexp)
    end

    Readable::MSG
  end

  def saved_games
    Dir.children('./saves')
  end
end
