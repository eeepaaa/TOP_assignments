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

    file = "./saves/#{Dir.children('./saves').length + 1}_#{file_name}"

    File.open(file, 'a') do |e|
      e.print string
    end
  end

  def restore_game(file_num)
    File.read "./saves/#{find_saved_game(file_num)}"
  end

  def find_saved_game(file_num)
    regexp = Regexp.new("#{file_num}_\\w")
    saved_games.each do |e|
      return e if e.match?(regexp)
    end
  end

  def saved_games
    return Dir.children('./saves').sort if Dir.children('./saves').length.positive?

    'There are no saved games.'
  end

  def delete_game(file_num)
    File.delete "./saves/#{find_saved_game(file_num)}"
  end
end
