# frozen_string_literal: false

require_relative '../lib/players'

describe Board do
  context "is able to access cells' value" do
    it "returns cells' values" do
      expect(Board.update_marked_cells).to eql(Array.new(9, ' '))
    end

    it "updates a cell's value" do
      Board.cell_one = 1
      expect(Board.update_marked_cells).to eql([1, ' ', ' ', ' ', ' ',
                                                ' ', ' ', ' ', ' '])
    end

    it "updates many cells' value" do
      Board.cell_one = 1
      Board.cell_three = 3
      Board.cell_five = 5
      expect(Board.update_marked_cells).to eql([1, ' ', 3, ' ', 5,
                                                ' ', ' ', ' ', ' '])
    end

    it "resets cells' values" do
      Board.cell_one = 1
      Board.cells_marked = [5]
      Board.reset
      expect(Board.update_marked_cells).to eql(Array.new(9, ' '))
    end
  end
end

describe Players do
  after(:each) { Board.reset }

  context 'are able to mark cells' do
    it 'on the top row' do
      Players.new.mark_cells_top(1)
      Players.new.mark_cells_top(2)
      Players.new.mark_cells_top(3)
      expect(Board.update_marked_cells).to eql(['X', 'X', 'X', ' ', ' ',
                                                ' ', ' ', ' ', ' '])
    end

    it 'on the middle row' do
      Players.new(name: 'Joe', mark: 'O').mark_cells_middle(4)
      Players.new(name: 'Joe', mark: 'O').mark_cells_middle(5)
      Players.new(name: 'Joe', mark: 'O').mark_cells_middle(6)
      expect(Board.update_marked_cells).to eql([' ', ' ', ' ', 'O', 'O',
                                                'O', ' ', ' ', ' '])
    end

    it 'on the bottom row' do
      Players.new.mark_cells_bottom(7)
      Players.new.mark_cells_bottom(8)
      Players.new.mark_cells_bottom(9)
      expect(Board.update_marked_cells).to eql([' ', ' ', ' ', ' ', ' ',
                                                ' ', 'X', 'X', 'X'])
    end
  end
end

describe Players do
  after(:each) { Board.reset }

  context 'are able to mark cells through #mark_on' do
    it 'on the top row' do
      Players.new.mark_on(2)
      expect(Board.update_marked_cells).to eql([' ', 'X', ' ', ' ', ' ',
                                                ' ', ' ', ' ', ' '])
    end

    it 'on the middle row' do
      Players.new.mark_on(5)
      expect(Board.update_marked_cells).to eql([' ', ' ', ' ', ' ', 'X',
                                                ' ', ' ', ' ', ' '])
    end

    it 'on the bottom row' do
      Players.new.mark_on(8)
      expect(Board.update_marked_cells).to eql([' ', ' ', ' ', ' ', ' ',
                                                ' ', ' ', 'X', ' '])
    end
  end
end

describe Players do
  context 'returns false if win patters are not present' do
    it 'rows-wise' do
      expect(Players.new.winner_rows?).not_to be true
    end

    it 'columns-wise' do
      expect(Players.new.winner_columns?).not_to be true
    end

    it 'diagonally' do
      expect(Players.new.winner_diagonal?).not_to be true
    end
  end
end

describe Players do
  after(:each) { Board.reset }

  context 'returns true if win patters are present rows-wise' do
    it 'on the top row' do
      Players.new.mark_on(1)
      Players.new.mark_on(2)
      Players.new.mark_on(3)
      expect(Players.new.winner_rows?).to be true
    end

    it 'on the middle row' do
      Players.new.mark_on(4)
      Players.new.mark_on(5)
      Players.new.mark_on(6)
      expect(Players.new.winner_rows?).to be true
    end

    it 'on the bottom row' do
      Players.new.mark_on(7)
      Players.new.mark_on(8)
      Players.new.mark_on(9)
      expect(Players.new.winner_rows?).to be true
    end
  end
end

describe Players do
  after(:each) { Board.reset }

  context 'returns true if win patters are present columns-wise' do
    it 'on the first column' do
      Players.new.mark_on(1)
      Players.new.mark_on(4)
      Players.new.mark_on(7)
      expect(Players.new.winner_columns?).to be true
    end

    it 'on the second column' do
      Players.new.mark_on(2)
      Players.new.mark_on(5)
      Players.new.mark_on(8)
      expect(Players.new.winner_columns?).to be true
    end

    it 'on the third column' do
      Players.new.mark_on(3)
      Players.new.mark_on(6)
      Players.new.mark_on(9)
      expect(Players.new.winner_columns?).to be true
    end
  end
end

describe Players do
  after(:each) { Board.reset }

  context 'returns true if win patters are present diagonally' do
    it 'from left to right' do
      Players.new.mark_on(1)
      Players.new.mark_on(5)
      Players.new.mark_on(9)
      expect(Players.new.winner_diagonal?).to be true
    end

    it 'from right to left' do
      Players.new.mark_on(3)
      Players.new.mark_on(5)
      Players.new.mark_on(7)
      expect(Players.new.winner_diagonal?).to be true
    end
  end
end

describe Players do
  it 'recognizes winner' do
    Players.new.mark_on(1)
    Players.new.mark_on(2)
    Players.new.mark_on(3)
    expect(Players.new.winner?).to be true
  end
end
