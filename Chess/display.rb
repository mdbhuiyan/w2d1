require_relative 'board.rb'
require_relative 'cursor.rb'
require 'colorize'

class Display

  attr_reader :board, :cursor
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end
  def display_grid
    puts "Display grid: "
    row = @board.grid.map.with_index do |row, i|
      build_row(row, i)
    end
  end

  def build_row(row, i)
    finished_row = row.map.each_with_index do |piece, j|

      # debugger
      if piece.is_a?(NullPiece)
        return_value = piece.name.colorize(:red)
        if [i,j] == cursor.cursor_pos
          return_value = piece.name.colorize(:background => :light_green)
        end
        return_value
      else
        return_value = piece.to_s #.name.colorize(:black)
        # debugger
        if [i,j] == cursor.cursor_pos
          return_value = piece.name.colorize(:background => :light_green)
        end
        return_value
      end
    end
    # debugger
    finished_row
  end

  def render
    system("clear")
    puts "START!"
    p cursor.cursor_pos

    display_grid.each do |row|
      # debugger
      puts row.join
    end


    start_pos = nil

    until start_pos
      # debugger
      system("clear")
      puts "Arrow keys, WASD, or vim to move, space or enter to confirm."
      display_grid.each { |row| puts row.join }

      start_pos = cursor.get_input
      if start_pos
        end_pos = cursor.get_input
        until end_pos
          end_pos = cursor.get_input
          system("clear")
          display_grid.each { |row| puts row.join }
        end
        @board.move_piece(start_pos, end_pos)
      end

    end
  end

end

b = Board.new
d = Display.new(b)
loop do
  d.render
end
# d.board.move_piece([1,1],[3,3])
# d.render
