# frozen_string_literal: false

require './lib/merge_sort'

describe MergeSort do
  context 'using recursion' do
    it 'returns if arr.length is less than 2' do
      expect(subject.merge_sort([1])).to eql([1])
    end

    it 'splits a two-element arr in halfs' do
      expect(subject.merge_sort([2, 1])).to eql([1, 2])
    end

    it 'splits a three-element arr in halfs' do
      expect(subject.merge_sort([3, 2, 1])).to eql([[3], [[2], [1]]])
    end

    it 'splits a four-element arr in halfs' do
      expect(subject.merge_sort([4, 3, 2, 1])).to eql([1, 2, 3, 4])
    end
  end
end
