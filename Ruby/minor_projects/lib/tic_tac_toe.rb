# frozen_string_literal: false

# Return value to Game class' methods
module BoardChecks
  private

  def mark_cells_top(cell)
    Game.cell_one = @mark if cell == 1
    Game.cell_two = @mark if cell == 2
    Game.cell_three = @mark if cell == 3
  end

  def mark_cells_middle(cell)
    Game.cell_four = @mark if cell == 4
    Game.cell_five = @mark if cell == 5
    Game.cell_six = @mark if cell == 6
  end

  def mark_cells_bottom(cell)
    Game.cell_seven = @mark if cell == 7
    Game.cell_eight = @mark if cell == 8
    Game.cell_nine = @mark if cell == 9
  end

  def mark_cells(cell)
    mark_cells_top(cell) if cell <= 3
    mark_cells_middle(cell) if cell <= 7
    mark_cells_bottom(cell) if cell <= 9
    Game.update_marked_cells
    Game.cells_marked << cell
  end

  def winner_top_row?
    true if Game.marked_cells[0] == @mark && Game.marked_cells[1] == @mark && Game.marked_cells[2] == @mark
  end

  def winner_middle_row?
    true if Game.marked_cells[3] == @mark && Game.marked_cells[4] == @mark && Game.marked_cells[5] == @mark
  end

  def winner_botton_row?
    true if Game.marked_cells[6] == @mark && Game.marked_cells[7] == @mark && Game.marked_cells[8] == @mark
  end

  def winner_rows?
    return true if winner_top_row?
    return true if winner_middle_row?
    return true if winner_botton_row?
  end

  def winner_first_column?
    true if Game.marked_cells[0] == @mark && Game.marked_cells[3] == @mark && Game.marked_cells[6] == @mark
  end

  def winner_second_column?
    true if Game.marked_cells[1] == @mark && Game.marked_cells[4] == @mark && Game.marked_cells[7] == @mark
  end

  def winner_third_column?
    true if Game.marked_cells[2] == @mark && Game.marked_cells[5] == @mark && Game.marked_cells[8] == @mark
  end

  def winner_columns?
    return true if winner_first_column?
    return true if winner_second_column?
    return true if winner_third_column?
  end

  def winner_diagonal?
    return true if Game.marked_cells[0] == @mark && Game.marked_cells[4] == @mark && Game.marked_cells[8] == @mark
    return true if Game.marked_cells[2] == @mark && Game.marked_cells[4] == @mark && Game.marked_cells[6] == @mark
  end
end

# Board data
class Game
  include BoardChecks
  attr_reader :name, :mark

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

  def self.cell_one=(value)
    @cell_one = value
  end

  def self.cell_two=(value)
    @cell_two = value
  end

  def self.cell_three=(value)
    @cell_three = value
  end

  def self.cell_four=(value)
    @cell_four = value
  end

  def self.cell_five=(value)
    @cell_five = value
  end

  def self.cell_six=(value)
    @cell_six = value
  end

  def self.cell_seven=(value)
    @cell_seven = value
  end

  def self.cell_eight=(value)
    @cell_eight = value
  end

  def self.cell_nine=(value)
    @cell_nine = value
  end

  def self.update_marked_cells
    @marked_cells = [@cell_one, @cell_two, @cell_three,
                     @cell_four, @cell_five, @cell_six,
                     @cell_seven, @cell_eight, @cell_nine]
  end

  def self.marked_cells
    @marked_cells
  end

  def self.cells_marked
    @cells_marked
  end

  def self.reset
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
  end

  def self.update_board
    puts "\n          |   |   "
    puts "1 - 3   #{@cell_one} | #{@cell_two} | #{@cell_three}  "
    puts '       ___|___|___'
    puts '          |   |   '
    puts "4 - 6   #{@cell_four} | #{@cell_five} | #{@cell_six}  "
    puts '       ___|___|___'
    puts '          |   |   '
    puts "7 - 9   #{@cell_seven} | #{@cell_eight} | #{@cell_nine}  "
    puts "          |   |   \n\n"
  end

  def initialize(name = 'You', mark = 'X')
    @name = name
    @mark = mark
  end

  def mark_on(cell)
    if Game.cells_marked.include?(cell)
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

  def win?
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

# Game starts
loop do
  puts 'Welcome to Tic Tac Toe!'
  print "\nWould you like to play:\na. alone?\nb. with a friend?\nType either 'a' or 'b': "
  answer = gets.chomp

  while true
    case answer[0]
    when /a/i
      player_one = Game.new
      player_two = Game.new('the Computer', 'O')
      puts "\nAlright! We're good to go."
      sleep(1.5)
      break
    when /b/i
      puts "\nAlright! We're good to go.\nYou'll play as 'X' and your friend as 'O'."
      player_one = Game.new
      player_two = Game.new('your friend', 'O')
      sleep(3)
      break
    else
      print "You must type either 'a' or 'b': "
      answer = gets.chomp
    end
  end

  round = 1

  while round < 10
    system('clear')

    case (round % 2).zero?
    # player_one's round
    when false
      player = 'your'
      puts "Round ##{round}: It's #{player} turn to mark a cell."
      Game.update_board
      print "\nChoose a cell to mark: "
      player_one.mark_on(gets.chomp.to_i)
      if player_one.win?
        system('clear')
        puts "Round ##{round}: It's #{player} turn to mark a cell."
        Game.update_board
        puts "You've won!"
        break
      end
    # player_two's round
    when true
      player = "#{player_two.name}'s"
      puts "Round ##{round}: It's #{player} turn to mark a cell."
      Game.update_board
      print "\nChoose a cell to mark: "
      player_two.mark_on(player_two.computer_mark) if player_two.name == 'the Computer'
      player_two.mark_on(gets.chomp.to_i) if player_two.name != 'the Computer'
      if player_two.win?
        system('clear')
        puts "Round ##{round}: It's #{player} turn to mark a cell."
        Game.update_board
        puts "#{player_two.name.capitalize}'s won!"
        break
      end
    end

    round += 1
  end

  print "\nWould you like to play again?\na. Yes\nb. No\nType either 'a' or 'b': "
  answer = gets.chomp

  case answer
  when /a/i
    puts "\nOkay! Program will reset right away..."
    sleep(1)
    system('clear')
    Game.reset
  when /b/i
    puts "\nOkay! Comeback soon..."
    sleep(1)
    break
  else
    puts "\nI'll take that as a 'No'. Comeback soon!"
    sleep(1)
    break
  end
end
