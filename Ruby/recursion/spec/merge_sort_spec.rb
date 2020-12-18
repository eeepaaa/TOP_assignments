# frozen_string_literal: false

require './lib/merge_sort'

describe MergeSort do
  context 'using recursion' do
    it 'returns if arr.length is less than 2' do
      expect(subject.merge_sort([1])).to eql([1])
    end

    it 'sorts a two-element arr' do
      expect(subject.merge_sort([2, 1])).to eql([1, 2])
    end

    it 'sorts a three-element arr' do
      expect(subject.merge_sort([2, 3, 1])).to eql([1, 2, 3])
    end

    it 'sorts a four-element arr' do
      expect(subject.merge_sort(([1, 2, 3, 4].shuffle))).to eql([1, 2, 3, 4])
    end
  end
end
