require 'pry'
class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  WIN_COMBINATIONS = [
    [0,1,2], #Top row
    [3,4,5], #Middle row
    [6,7,8], #Bottom row
    [0,4,8], #Diag 1
    [2,4,6], #Diag 2
    [0,3,6], #left column
    [1,4,7], #mid column
    [2,5,8] #right column
  ]
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  def input_to_index(user_input)
    @index = user_input.to_i - 1
  end
  def move(index, player = "X")
    #binding.pry
    @board[index]=player
  end
  def position_taken?(index)
    @board[index] == " " ? false : true
  end
  def valid_move?(position)
    position.between?(0, 8) && !position_taken?(position)
  end
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  def current_player
    @player = turn_count % 2 == 0 ? "X" : "O"
  end
  def turn
    puts "Pick a position 1-9: "
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end
  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_brd = Array.new
      win_combination.each do |i|
        win_brd << @board[i]
        binding.pry
        if win_brd.size == 3 && (win_brd.all? { |e| e == "O"  } || win_brd.all? { |e| e == "X"  })
          return win_combination
        end
      end #close win_combination.each
    return nil
    end #close WIN_COMBINATIONS.each 
  end #close won?   
      
end #close TicTacToe class