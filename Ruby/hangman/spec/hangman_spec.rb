# frozen_string_literal: false

require './lib/game'

describe Readable do
  it 'extracts and returns a word from txt file.' do
    expect(subject.extract_word).to eql 'beauty'
  end

  context 'saves.' do
    it 'data to file.' do
      subject.save_game('save_spec', 'it worked!')
      success_msg = File.readlines('./saves/0_save_spec')
      expect(success_msg[0]).to include 'it worked!'
    end
  end

  context 'restores' do
    it 'data from json_string.' do
      obj = JSON.parse('{"json_class":"Game","data":{"word":"intelligent",' \
                       '"guesses":3,"tried":"lg"}}', create_additions: true)
      word = 'i _ _ e l l _ g e _ t'
      expect(obj.update_word('e')).to eql word
    end

    it 'data from file.' do
      expect(subject.restore_game(0)).to eql 'it worked!'
    end
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
    subject.tried += 'a'
    subject.tried += 'b'
    expect(subject.tried).to eql 'ab'
    subject.tried = ''
  end

  it 'replaces missing letters tried correctly.' do
    subject.tried += 'u'
    subject.tried += 'a'
    expect(subject.update_word('e')).to eql 'b e a u _ y'
  end
end
