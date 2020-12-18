# frozen_string_literal: false

require 'json'
require './lib/readable'

# Game's output methods
class Game
  include Readable
  attr_accessor :word, :guesses, :tried

  def self.json_create(_obj)
    new
  end

  def initialize
    @word = extract_word
    @guesses = 0
    @hidden_word = @word[1..-2].split('').map { '_' }.join(' ')
    @tried = ''
  end

  def update_word(guess)
    @guesses += 1
    @tried += guess
    @hidden_word = @hidden_word.split(/\s/)

    @word[1..-2].split('').each_index do |i|
      @tried.split('').each do |e|
        @hidden_word[i] = e if @word[1..-2].split('')[i] == e
      end
    end

    @hidden_word = @hidden_word.join(' ')
    show_word
  end

  def to_s
    if @tried.empty?
      "The word is: #{@word}. The number of guesses is: #{@guesses}, " \
      'and no letters have been tried yet.'
    else
      "The word is: #{@word}. The number of guesses is: #{@guesses}, " \
      "and the letters tried are: #{@tried}."
    end
  end

  def to_json(*_param)
    {
      json_class: self.class.name,
      data: {
        word: @word,
        guesses: @guesses,
        tried: @tried
      }
    }.to_json
  end

  private

  def show_word
    "#{@word[0]} #{@hidden_word} #{@word[-1]}"
  end
end
