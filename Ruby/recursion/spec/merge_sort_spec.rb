# frozen_string_literal: false

require './lib/merge_sort'

describe MergeSort do
  context 'using recursion' do
    it 'returns if arr.length is less than 2' do
      expect(subject.merge_sort([1])).to eql([1])
    end

    it 'splits arr in halfs' do
      expect(subject.merge_sort([2, 1])).to eql([[2], [1]])
    end
  end
end
