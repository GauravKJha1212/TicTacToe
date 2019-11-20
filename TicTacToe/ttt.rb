# frozen_string_literal: true

require "./tic_tac_toe.rb"
require "./my_methods.rb"

ttt = TicTacToe.new
ttt.intro
ttt.play
read_char
system("reset")
