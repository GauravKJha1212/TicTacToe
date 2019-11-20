# frozen_string_literal: true

class Player
  attr_accessor :name, :piece
  def initialize(name, piece, board)
    @name = name
    @piece = piece
    @board = board
  end

  def put_piece
    @board.show(@name) until @board.add_piece(input_coordinates, @piece)
  end

  def input_coordinates
    x = 1
    y = 1
    loop do
      case read_char
      when "\e"
        exit
      when "\r"
        return [x, y]
      when "\e[A"
        @board.show(@name, [x = (x - 1) % 3, y])
      when "\e[B"
        @board.show(@name, [x = (x + 1) % 3, y])
      when "\e[C"
        @board.show(@name, [x, y = (y + 1) % 3])
      when "\e[D"
        @board.show(@name, [x, y = (y - 1) % 3])
      else
        next
      end
    end
  end
end
