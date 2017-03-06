require_relative 'piece.rb'
require 'byebug'
class Board

  def initialize(grid = nil)
    @grid = Array.new(8) {Array.new(8)}
    populate_board
  end

  def populate_board
    # self[[0,0]] = Piece.new("P")
    @grid.each_with_index do |row, i|
      row.each_with_index do |piece, j|
        self[[i,j]] = Piece.new("P") if i == 0 || i == 1 || i == 6 || i == 7
      end
    end
  end

  def []=(pos, piece)
    row, col = pos
    @grid[row][col] = piece
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def move_piece(start_pos, end_pos)
    # debugger
    raise "No piece at start_pos" if self[start_pos].nil?
    raise "Can't move to end_pos, it's not empty" unless self[end_pos].nil?
    start_piece = self[start_pos]
    self[end_pos] = start_piece
    self[start_pos] = nil
    @grid
  end

end


# b = Board.new
# b.move_piece([0,0],[1,1])
