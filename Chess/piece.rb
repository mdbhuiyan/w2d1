require_relative 'board.rb'
require 'colorize'

class Piece

  attr_reader :name, :color, :board

  # def initialize(name, color)
  def initialize(color, board, position)
    @color = color
    @board = board
    @position = board.add_piece(self, position)
  end

  def to_s
    symbol.colorize(color)
  end

  def symbol
  end
  # def to_s
  #   @name.colorize(color)
  # end

  def inspect
    @name.inspect
  end

  def moves

  end

end
