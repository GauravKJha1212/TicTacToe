# frozen_string_literal: true

class Board
  def initialize
    @board = Array.new(3) { Array.new(3) }
  end

  def show(name=nil, coords=[1, 1])
    a = -1
    system("clear")
    @board.each do |row|
      10.times { puts }
      a += 1
      b = -1
      row.each do |cell|
        10.times { print "   " }
        piece = cell ? cell : "*"
        print(a == coords[0] && (b += 1) == coords[1] ? piece.red : piece.blue)
      end
    end
    puts
    print "\n\n\t\t\t\t\t\t\t#{name&.split(' ')&.first}'s turn"
  end

  def add_piece(coords, piece)
    @board[coords[0]][coords[1]] = piece if coordinates_available?(coords)
  end

  def coordinates_available?(coords)
    @board[coords[0]][coords[1]].nil?
  end

  def winning_combination?(piece)
    winning_positions?(verticals, piece) || winning_positions?(horizontals, piece) || winning_positions?(diagonals, piece)
  end

  def winning_positions?(positions, piece)
    positions.any? {|line| line.all? {|cell| cell == piece } }
  end

  def verticals
    @board
  end

  def horizontals
    @board.transpose
  end

  def diagonals
    [[@board[0][0], @board[1][1], @board[2][2]], [@board[2][0], @board[1][1], @board[0][2]]]
  end

  def full?
    @board.all? {|row| row.none?(&:nil?) }
  end
end
