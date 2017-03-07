require_relative 'piece.rb'
require_relative 'SlidingPiece.rb'

class King < Piece
  include SlidingPiece

  def initialize(color)
    @name = ' ♚ '
    @color = color
  end

end
