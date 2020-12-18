# frozen_string_literal: false

require './lib/readable'

# Game's output methods
class Game
  include Readable
  attr_accessor :word, :guesses, :guessed

  def initialize
    @word = extract_word
    @guesses = 0
    @word_length = @word.length
    @hidden_word = @word[1..-2].split('').map { '_' }.join(' ')
    @guessed = ''
  end

  def update_word(guess)
    @guesses += 1
    @guessed += guess
    @hidden_word = @hidden_word.split(/\s/)

    @word[1..-2].split('').each_index do |i|
      @guessed.split('').each do |e|
        @hidden_word[i] = e if @word[1..-2].split('')[i] == e
      end
    end

    @hidden_word = @hidden_word.join(' ')
    show_word
  end

  private

  def show_word
    "#{@word[0]} #{@hidden_word} #{@word[-1]}"
  end
end
