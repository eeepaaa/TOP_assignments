# frozen_string_literal: false

# I/O methods
module Readable
  module_function

  MSG = 'No saved games found matching search criteria'.freeze

  def extract_word
    file = Readable.save_word_list
    file[0].split(/\W/).join # TODO: replace '0' with rand(file.length)
  end

  def save_word_list
    file = File.readlines 'word.txt' # TODO: replace 'word' with 'words'
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

  def restore_game(file_num = '')
    return Readable::MSG if !Dir.exist?('saves') || file_num == ''

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
