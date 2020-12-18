# frozen_string_literal: false

# Returns board's state information.
class Board
  @cell_one = ' '
  @cell_two = ' '
  @cell_three = ' '
  @cell_four = ' '
  @cell_five = ' '
  @cell_six = ' '
  @cell_seven = ' '
  @cell_eight = ' '
  @cell_nine = ' '
  @marked_cells = []
  @cells_marked = []

  class << self
    attr_accessor :cell_one, :cell_two, :cell_three, :cell_four,
                  :cell_five, :cell_six, :cell_seven, :cell_eight,
                  :cell_nine, :cells_marked

    def update_marked_cells
      @marked_cells = [cell_one, cell_two, cell_three,
                       cell_four, cell_five, cell_six,
                       cell_seven, cell_eight, cell_nine]
    end

    def update_board
      puts "\n          |   |   "
      puts "1 - 3   #{cell_one} | #{cell_two} | #{cell_three}  "
      puts '       ___|___|___'
      puts '          |   |   '
      puts "4 - 6   #{@cell_four} | #{@cell_five} | #{@cell_six}  "
      puts '       ___|___|___'
      puts '          |   |   '
      puts "7 - 9   #{cell_seven} | #{cell_eight} | #{cell_nine}  "
      puts "          |   |   \n\n"
    end
  end
end
