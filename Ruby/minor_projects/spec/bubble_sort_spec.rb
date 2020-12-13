# frozen_string_literal: false

require './bubble_sort'

describe BubbleSort do
  it 'sorts only if needed' do
    expect(subject.bubble_sort([1, 2, 3, 4])).to eql([1, 2, 3, 4])
  end

  it 'sorts two numbers' do
    expect(subject.bubble_sort([2, 1])).to eql([1, 2])
  end

  it 'sorts many numbers' do
    expect(subject.bubble_sort([2, 1, 6, 5, 0, 4, 3])).to eql([0, 1, 2, 3, 4, 5, 6])
  end

  it 'sorts negative numbers' do
    expect(subject.bubble_sort([1, 0, -1, -2, -3, -4, -5])).to eql([-5, -4, -3, -2, -1, 0, 1])
  end
end
