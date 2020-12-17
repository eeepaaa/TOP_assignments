# frozen_string_literal: false

# MergeShort method
class MergeSort
  def merge_sort(arr, sorted_arr = [])
    return sorted_arr << arr[0] if arr.length < 2
   
    if arr.length == 2
      if arr[0] > arr[1]
        temp = arr[0]
        arr[0] = arr[1]
        arr[1] = temp
        return sorted_arr << arr[0] << arr[1]
      else 
        return sorted_arr << arr[0] << arr[1]
      end
    end

    right_half = merge_sort(arr.slice!(0, arr.length / 2), sorted_arr)
    left_half = merge_sort(arr, sorted_arr)

    sorted_arr
  end
end
