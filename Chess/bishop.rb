require_relative 'piece.rb'
require_relative 'SlidingPiece.rb'

class Bishop < Piece
  include SlidingPiece

  def initialize(color)
    @name = ' ♝ '
    @color = color
    # @board = board
  end

  def move_dirs
  end

end
