# frozen_string_literal: false

require './lib/bubble_sort'
require './lib/caesar_cipher'
require './lib/fibonacci'
require './lib/merge_sort'

describe BubbleSort do
  it 'sorts a randomly generated array of 10 elements.' do
    arr = [rand(100), rand(100), rand(100), rand(100), rand(100),
           rand(100), rand(100), rand(100), rand(100), rand(100)]
    expect(subject.bubble_sort(arr)).to eql arr.sort
  end
end

describe CaesarCipher do
  it 'it ignores non-letter elements and numbers' do
    expect(subject.caesar_cipher('!,3')).to eql('!,3')
  end

  it 'retains casing' do
    expect(subject.caesar_cipher('ABC', 1)).to eql 'BCD'
  end

  it 'works with no shift value present' do
    expect(subject.caesar_cipher('Hola')).to eql 'Hola'
  end

  it 'works with negative shift value' do
    expect(subject.caesar_cipher('BCD', -1)).to eql 'ABC'
  end
end

describe Fibonacci do
  context 'using iteration' do
    it 'returns 5 if fib(4)' do
      expect(subject.fibonacci_iteration(4)).to be 5
    end
  end

  context 'using recursion' do
    it 'returns 13 if fib(6)' do
      expect(subject.fibonacci_iteration(6)).to be 13
    end
  end
end

describe MergeSort do
  it 'should sort a randomly generated array, but somehow the expectaion is broken (?)' do
    arr = [9, 5, 3, 1, 4, 6, 7, 8, 2, 10]
    expect(subject.merge_sort(arr)).to eql [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  end
end
