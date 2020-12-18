# frozen_string_literal: false

require './lib/readable'
require './lib/game'

describe Readable do
  it 'extracts and returns a word from txt file.' do
    expect(subject.extract_word).to eql 'beauty'
  end
end

describe Game do
  it 'updates extracted word.' do
    expect(subject.word).to eql 'beauty'
  end

  it "recognizes word's length." do
    expect(subject.word.length).to be 6
  end

  it 'updates guesses counter.' do
    expect(subject.guesses += 1).to be 1
    subject.guesses = 0
  end

  it 'logs tried letters.' do
    subject.guessed += 'a'
    subject.guessed += 'b'
    expect(subject.guessed).to eql 'ab'
    subject.guessed = ''
  end

  it 'replaces missing letters guessed correctly.' do
    subject.guessed += 'u'
    subject.guessed += 'a'
    expect(subject.update_word('e')).to eql 'b e a u _ y'
  end
end
