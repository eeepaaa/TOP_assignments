# frozen_string_literal: false

require_relative 'board'
require_relative 'enabled'

# If 'enabled' module returns 'true', Players' moves are valid.
class Players
  include Enabled

  attr_reader :name, :mark

  def initialize(name: 'Joe', mark: 'X')
    @name = name
    @mark = mark
  end

  def mark_on(cell)
    if Board.cells_marked.include?(cell)
      print "Cannot mark cell ##{cell}. Choose a different one: "
    elsif cell >= 1 && cell <= 9
      mark_cells(cell)
      return
    else
      print "Cannot mark cell ##{cell}. Choose a different one: "
    end
    cell = gets.chomp.to_i
    mark_on(cell)
  end

  def winner?
    return true if winner_rows?
    return true if winner_columns?
    return true if winner_diagonal?
  end

  def computer_mark
    cell = rand(9)
    cell += 1 if cell.zero?
    if Game.cells_marked.include?(cell)
      computer_mark
    else
      cell
    end
  end
end
