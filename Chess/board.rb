require_relative 'piece.rb'
require_relative 'null_piece.rb'
require_relative 'rook.rb'
require_relative 'cursor.rb'
require_relative 'knight.rb'
require_relative 'queen.rb'
require_relative 'king.rb'
require_relative 'bishop.rb'
require_relative 'pawn.rb'
require 'byebug'
class Board

  attr_reader :grid
  def initialize(grid = nil)
    @grid = Array.new(8) {Array.new(8) {} }
    populate_board
  end

  def add_piece(piece, pos)
    self[pos] = piece
  end

  def populate_board
  figures_classes = ["Rook", "Knight", "Bishop", "King",
                      "Queen", "Bishop", "Knight", "Rook"]

    # array_figures = ["[R]", "[K]", "[B]", "[K]", "[Q]", "[B]", "[K]", "[R]"]
    @grid.each_with_index do |row, i|

      row.each_with_index do |piece, j|
        if i == 0
          # debugger
          self[[i,j]] = (eval"#{figures_classes[j]}.new(:blue)")
          # self[[i,j]] = Piece.new("#{array_figures[j]}", :blue)
          # self[[i,j]] = eval("#{figures_classes[j]}.new(:blue)")
        elsif i == 1
          self[[i,j]] = Pawn.new(:blue)
          # puts "CLASS : #{figures_classes[0]}.class"
          # self[[i,j]] = "#{figures_classes[0].class.new("#{array_figures[0]}", :blue)}"
        elsif i == 7
          self[[i,j]] = (eval"#{figures_classes[j]}.new(:red)")
        elsif i == 6
          self[[i,j]] = Pawn.new(:red)
        else i != 0 || i != 7
          self[[i,j]] = NullPiece.new()
        end
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
    raise "No piece at start_pos" if self[start_pos].is_a?(NullPiece)
    raise "Can't move to end_pos, it's not empty" unless self[end_pos].is_a?(NullPiece)
    start_piece = self[start_pos]
    self[end_pos] = start_piece
    self[start_pos] = NullPiece.new
    @grid
  end

  def valid_pos?(pos)
     pos.all? { |coord| coord.between?(0, 7) }
  end
end


# b = Board.new
# b.move_piece([0,0],[1,1])
