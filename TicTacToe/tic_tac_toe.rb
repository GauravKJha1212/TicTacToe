# frozen_string_literal: true

require "./board.rb"
require "./player.rb"

class TicTacToe
  def initialize
    @board = Board.new
    @player1 = Player.new("Player_1", "X", @board)
    @player2 = Player.new("Player_2", "O", @board)
    @current_player = @player1
  end

  def create_profiles_load
    puts "\n\n\n\n\t\t\t\t\t\t__________________________\n\n\n\n\t\t\t\t\t\t   Creating profiles !!\n\n"
    100.times {|i| sleep(0.05) && print("\t\t\t\t\t\t\t  #{['─', '\\', '|', '/'][i % 4]}  #{i} %\r") }
  end

  def input_profiles
    puts "\t\t\t\t\t\t__________________________\n\n\n\n\n"
    print "\t\t\t\t\t\t  Player 1 (X) : "
    name = gets.chomp
    @player1.name = name unless name.empty?
    print "\n\n\t\t\t\t\t\t  Player 2 (O) : "
    name = gets.chomp
    @player2.name = name unless name.empty?
    create_profiles_load
  end

  def intro
    system("clear")
    5.times { puts }
    puts "\t\t\t\t\t\tWant to enter intro? (y/n)\n\n\n\n"
    input_profiles if read_char == "y"
  end

  def play
    loop do
      @board.show(@current_player.name)
      @current_player.put_piece
      break if game_over?
      switch_players
    end
  end

  def game_over?
    victory? || draw?
  end

  def victory?
    @board.show(@current_player.name) || !declare_winner if @board.winning_combination?(@current_player.piece)
  end

  def draw?
    @board.show(@current_player.name) || !declare_draw if @board.full?
  end

  def declare_winner
    puts "\r\t\t\t\t\t\tCongratulations #{@current_player.name}, you won!"
  end

  def declare_draw
    puts "\r\t\t\t\t\tThe game is drawn... No loser!... Hurray!!!"
  end

  def switch_players
    @current_player = @current_player == @player1 ? @player2 : @player1
  end
end
