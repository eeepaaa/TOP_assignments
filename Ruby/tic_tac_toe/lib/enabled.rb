# frozen_string_literal: false

require_relative 'board'

# Returns boolean to Players' methods
module Enabled
  def mark_cells_top(cell)
    Board.cell_one = @mark if cell == 1
    Board.cell_two = @mark if cell == 2
    Board.cell_three = @mark if cell == 3
  end

  def mark_cells_middle(cell)
    Board.cell_four = @mark if cell == 4
    Board.cell_five = @mark if cell == 5
    Board.cell_six = @mark if cell == 6
  end

  def mark_cells_bottom(cell)
    Board.cell_seven = @mark if cell == 7
    Board.cell_eight = @mark if cell == 8
    Board.cell_nine = @mark if cell == 9
  end

  def mark_cells(cell)
    mark_cells_top(cell) if cell <= 3
    mark_cells_middle(cell) if cell <= 6
    mark_cells_bottom(cell) if cell <= 9
    Board.update_marked_cells
    Board.cells_marked << cell
  end

  def winner_top_row?
    cell_one = Board.update_marked_cells[0]
    cell_two = Board.update_marked_cells[1]
    cell_three = Board.update_marked_cells[2]
    return unless cell_one == @mark && cell_two == @mark && cell_three == @mark

    true
  end

  def winner_middle_row?
    cell_four = Board.update_marked_cells[3]
    cell_five = Board.update_marked_cells[4]
    cell_six = Board.update_marked_cells[5]
    return unless cell_four == @mark && cell_five == @mark && cell_six == @mark

    true
  end

  def winner_bottom_row?
    cell_seven = Board.update_marked_cells[6]
    cell_eight = Board.update_marked_cells[7]
    cell_nine = Board.update_marked_cells[8]
    return unless cell_seven == @mark && cell_eight == @mark && cell_nine == @mark

    true
  end

  def winner_rows?
    return true if winner_top_row?
    return true if winner_middle_row?
    return true if winner_bottom_row?
  end

  def winner_first_column?
    cell_one = Board.update_marked_cells[0]
    cell_four = Board.update_marked_cells[3]
    cell_seven = Board.update_marked_cells[6]
    return unless cell_one == @mark && cell_four == @mark && cell_seven == @mark

    true
  end

  def winner_second_column?
    cell_two = Board.update_marked_cells[1]
    cell_five = Board.update_marked_cells[4]
    cell_eight = Board.update_marked_cells[7]
    return unless cell_two == @mark && cell_five == @mark && cell_eight == @mark

    true
  end

  def winner_third_column?
    cell_three = Board.update_marked_cells[2]
    cell_six = Board.update_marked_cells[5]
    cell_nine = Board.update_marked_cells[8]
    return unless cell_three == @mark && cell_six == @mark && cell_nine == @mark

    true
  end

  def winner_columns?
    return true if winner_first_column?
    return true if winner_second_column?
    return true if winner_third_column?
  end

  def winner_diagonal?
    cell_one = Board.update_marked_cells[0]
    cell_three = Board.update_marked_cells[2]
    cell_five = Board.update_marked_cells[4]
    cell_seven = Board.update_marked_cells[6]
    cell_nine = Board.update_marked_cells[8]

    if cell_one == @mark && cell_five == @mark && cell_nine == @mark
      true

    elsif cell_three == @mark && cell_five == @mark && cell_seven == @mark
      true
    end
  end
end
