# frozen_string_literal: false

require './lib/merge_sort'

describe MergeSort do
  it "returns if arr's length is less than or equal to 1" do
    expect(subject.merge_sort([1])).to eql(1)
  end

  it 'splits arr in half' do
    expect(subject.merge_sort([2, 1])).to eql([2, 1])
  end

  xit 'sorts halves' do
    expect(subject.marge_sort([2, 1])).to eql([1, 2])
  end
end
