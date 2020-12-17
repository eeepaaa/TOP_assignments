# frozen_string_literal: false

require './lib/merge_sort'

describe MergeSort do
  xcontext 'not using recursion' do
    it "returns if arr's length is less than or equal to 1" do
      expect(subject.merge_sort([1])).to eql([1])
    end

    it 'splits arr in half' do
      expect(subject.merge_sort([2, 1])).to eql([[2], [1]])
    end

    it 'splits arr in half' do
      expect(subject.merge_sort([4, 3, 2, 1])).to eql([[4, 3], [2, 1]])
    end
  end

  context 'using recursion' do
    it "returns if arr's length is less than or equal to 1" do
      expect(subject.merge_sort([1])).to eql([1])
    end

    it 'splits arr in half' do
      expect(subject.merge_sort([2, 1])).to eql([[2], [1]])
    end

    it 'splits arr in half' do
      expect(subject.merge_sort([4, 3, 2, 1])).to eql([[[4], [3]], [[2], [1]]])
    end
  end
end
