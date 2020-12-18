# frozen_string_literal: false

# I/O methods
module Readable
  module_function

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
end
