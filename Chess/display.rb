require_relative 'board.rb'
require 'cursror.rb'
require 'colorize'

class Display

  def initialize(board)
    @cursror = Cursor.new([0,0], board)
  end

end
