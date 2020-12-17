# frozen_string_literal: false

# Fibonacci methods
class Fibonacci
  def fibonacci_iteration(num)
    return 1 if num <= 1

    sequence = [0, 1, 1]
    counter = 3
    num += 1

    loop do
      sequence << sequence[counter - 1] + sequence[counter - 2]
      counter += 1
      break if counter > num
    end

    sequence[num]
  end

  def fibonacci_recursive(num)
    num <= 1 ? 1 : fibonacci_recursive(num - 1) + fibonacci_recursive(num - 2)
  end
end
