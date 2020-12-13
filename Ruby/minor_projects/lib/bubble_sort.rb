# frozen_string_literal: false

# Sorts arrays
class BubbleSort
  def bubble_sort(arr = [3, 2, 5, 4])
    catch :sort do
      arr.each_index do |i|
        next if i.zero?

        case arr[i - 1] <=> arr[i]
        when 1
          temp = arr[i - 1]
          arr[i - 1] = arr[i]
          arr[i] = temp
          bubble_sort(arr)
          throw :sort
        end
      end
    end
    arr
  end
end
