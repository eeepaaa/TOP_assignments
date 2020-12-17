# frozen_string_literal: false

# MergeShort method
class MergeSort
  def merge_sort(arr, sorted_arr = [])
    return arr if arr.length < 2

    right_half = merge_sort(arr.slice!(0, arr.length / 2))
    left_half = merge_sort(arr)

    sorted_arr << right_half << left_half
  end
end
