require_relative 'piece.rb'
require_relative 'SlidingPiece.rb'

class Knight < Piece
  include SlidingPiece

  # def initialize(color)
  #   @name = ' ♞ '
  #   @color = color
  # end

  def symbol
    ' ♞ '
  end


  def moves

  end

end
