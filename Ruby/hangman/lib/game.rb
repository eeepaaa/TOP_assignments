# frozen_string_literal: false

require 'json'
require './lib/readable'

# Game's output methods
class Game
  include Readable
  attr_accessor :word, :guesses, :tried, :hidden_word

  def self.json_create(obj)
    new(obj['data']['word'], obj['data']['guesses'], obj['data']['tried'])
  end

  def initialize(word = extract_word, guesses = 0, tried = '')
    @word = word
    @guesses = guesses
    @hidden_word = @word[1..-2].split('').map { '_' }.join(' ')
    @tried = tried
  end

  def update_word(guess)
    @guesses += 1 unless @word[1..-2].include?(guess)
    @tried += guess unless @tried.include?(guess)
    @hidden_word = @hidden_word.split(/\s/)

    @word[1..-2].split('').each_index do |i|
      @tried.split('').each do |e|
        @hidden_word[i] = e if @word[1..-2].split('')[i] == e
      end
    end

    show_word
  end

  def show_word
    @hidden_word = @hidden_word.join(' ') if @hidden_word.instance_of?(Array)
    "#{@word[0]} #{@hidden_word} #{@word[-1]}"
  end

  def to_s
    if @guesses < 5
      "Your guess count is: #{@guesses}. You have #{5 - guesses} hints remaining."
    else
      "You're out of guesses. Sorry."
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
end
