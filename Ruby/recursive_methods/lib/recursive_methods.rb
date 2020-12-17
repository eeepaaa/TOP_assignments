# frozen_string_literal: false

# Definition of all recursive methods
class RecursiveMethods
  def factorial(num)
    num <= 1 ? 1 : num * factorial(num - 1)
  end

  def bottles_of_beer(num)
    return puts 'No more bottles of beer on the wall' if num.zero?

    puts "#{num} bottles of beer on the wall"
    bottles_of_beer(num - 1)
  end

  def fibonacci(num)
    num <= 2 ? 1 : fibonacci(num - 2) + fibonacci(num - 1)
  end

  def flatten_array(arr, flat_arr = [])
    arr.each do |e|
      if e.instance_of?(Array)
        flatten_array(e, flat_arr)
      else
        flat_arr << e
      end
    end
    flat_arr
  end

  def palindrome(string)
    if string.length <= 1
      true
    elsif string[0] == string[-1]
      palindrome(string[1..-2])
    else
      false
    end
  end
end
