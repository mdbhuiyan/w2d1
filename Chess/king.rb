require_relative 'piece.rb'
require_relative 'SlidingPiece.rb'

class King < Piece
  include SlidingPiece

  # def initialize(color, board)
  #   @board = board
  #   @name = ' ♚ '
  #   @color = color
  # end

  def symbol
    ' ♚ '
  end

  def moves

  end

  MOVES = [
    [1, 0],
    [1, -1],
    [1, 1],
    [0, 1],
    [0, -1],
    [-1, -1],
    [-1, 0],
    [-1, 0]
  ]

end
