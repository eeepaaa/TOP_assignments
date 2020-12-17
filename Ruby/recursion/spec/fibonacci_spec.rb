# frozen_string_literal: false

require './lib/fibonacci'

describe Fibonacci do
  context 'using iteration' do
    it 'fibonacci(0) returns 1' do
      expect(subject.fibonacci_iteration(0)).to eql(1)
    end

    it 'fibonacci(1) returns 1' do
      expect(subject.fibonacci_iteration(0)).to eql(1)
    end

    it 'fibonacci(2) returns 2' do
      expect(subject.fibonacci_iteration(2)).to eql(2)
    end

    it 'fibonacci(3) returns 3' do
      expect(subject.fibonacci_iteration(3)).to eql(3)
    end

    it 'fibonacci(4) returns 5' do
      expect(subject.fibonacci_iteration(4)).to eql(5)
    end

    it 'fibonacci(5) returns 8' do
      expect(subject.fibonacci_iteration(5)).to eql(8)
    end

    it 'fibonacci(6) returns 13' do
      expect(subject.fibonacci_iteration(6)).to eql(13)
    end
  end
end

describe Fibonacci do
  context 'using recursion' do
    it 'fibonacci(6) returns 13' do
      expect(subject.fibonacci_recursive(6)).to eql(13)
    end

    it 'fibonacci(5) returns 5' do
      expect(subject.fibonacci_recursive(4)).to eql(5)
    end
  end
end
