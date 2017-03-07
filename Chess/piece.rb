require_relative 'board.rb'
require 'colorize'

class Piece

  attr_reader :name, :color
  # def initialize(name, color, board, position)
  def initialize(name, color)
    @name =  name
    @color = color
    # @board = board
    # @position = board.add_piece(self, position)
  end

  def to_s
    @name.colorize(color)
  end

  def inspect
    @name.inspect
  end

  def moves

  end

end
