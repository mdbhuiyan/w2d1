require_relative "piece.rb"

class NullPiece < Piece

  attr_reader :name
  def initialize
    # @name = "[ ]"
    # @color = :red

    super("[ ]", :red)
  end
end
