# frozen_string_literal: false

require './lib/caesar_cipher'

describe CaesarCipher do
  it 'ciphers only when shift value is present' do
    expect(subject.caesar_cipher('Hello')).to eql('Hello')
  end

  it 'ciphers only letters' do
    expect(subject.caesar_cipher('!-*?/')).to eql('!-*?/')
  end

  it 'ciphers only letter' do
    expect(subject.caesar_cipher('a', 1)).to eql('b')
  end

  it 'ciphers one word' do
    expect(subject.caesar_cipher('abc', 2)).to eql('cde')
  end

  it 'ciphers two words' do
    expect(subject.caesar_cipher('abc def', 1)).to eql('bcd efg')
  end

  it 'ciphers retains capital letters' do
    expect(subject.caesar_cipher('Hello', 1)).to eql('Ifmmp')
  end

  it 'ciphers many words' do
    expect(subject.caesar_cipher('Hello, World... and you.', 5)).to eql('Mjqqt, Btwqi... fsi dtz.')
  end

  it 'ciphers based on negative shift values' do
    expect(subject.caesar_cipher('Mjqqt, Btwqi!', -5)).to eql('Hello, World!')
  end
end
