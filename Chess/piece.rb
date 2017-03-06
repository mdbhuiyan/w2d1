class Piece

  attr_reader :name
  def initialize(name)
    @name = name
  end

  def inspect
    @name.inspect
  end
end

class NullPiece < Piece

  def initialize
    super(nil)
  end
end
