# frozen_string_literal: false

require './lib/recursive_methods'

describe RecursiveMethods do
  it '#factorial succeeded' do
    expect(subject.factorial(5)).to eql(120)
  end

  it '#fibonacci succeeded' do
    expect(subject.fibonacci(6)).to eql(8)
  end

  it '#flatten_arr succeeded' do
    expect(subject.flatten_array([[1, [2, 3], 4], 5, [6, 7, 8], [9, [10]]])).to eql([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
  end

  it '#palindrome succeeded' do
    expect(subject.palindrome('car')).to be false
  end

  it '#palindrome succeeded' do
    expect(subject.palindrome('bob')).to be true
  end
end
