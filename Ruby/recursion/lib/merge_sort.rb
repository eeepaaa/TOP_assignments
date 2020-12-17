# frozen_string_literal: false

# MergeShort method
class MergeSort
  def merge_sort(arr, sorted_arr = [])
    return arr[0] if arr.length < 2

    right_half = arr.slice!(0, arr.length / 2)
    left_half = arr

    sorted_arr << right_half[0] << left_half[0]
  end
end

# merge_sort(arr.slice!(0, arr.length / 2), sorted_arr)
# merge_sort(arr, sorted_arr)

# p MergeSort.new.merge_sort([4, 3, 2, 1])
# p MergeSort.new.merge_sort([6, 5, 4, 3, 2, 1])
