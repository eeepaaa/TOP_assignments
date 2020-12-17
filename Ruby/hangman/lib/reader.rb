# frozen_string_literal: false

# I/O methods
module Reader
  module_function

  def extract_word
    file = Reader.read_file
    file[rand(file.length)].split(/\W/).join
  end

  def read_file
    file = File.readlines 'words.txt'
    file.select do |e|
      e = e.split(/\W/).join
      e.length >= 5 && e.length <= 12
    end
  end
end
