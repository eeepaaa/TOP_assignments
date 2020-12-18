# frozen_string_literal: false

# MergeShort method
class MergeSort
  def merge_sort(arr)
    return arr if arr.length <= 1

    left = merge_sort(arr.slice!(0, arr.length / 2))
    right = merge_sort(arr)

    merge(left, right)
  end

  def merge(left, right, sorted_arr = [])
    (left.length + right.length).times do
      sorted_arr << if left.empty?
                      right.shift
                    elsif right.empty?
                      left.shift
                    else
                      case left <=> right
                      when -1 then left.shift
                      when 1 then right.shift
                      else left.shift
                      end
                    end
    end

    sorted_arr
  end
end
