class TicTacToe

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]

def initialize
  @board = Array.new(9, " ")
end

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(index, current_player = "X")
  @board[index] = current_player
end

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn_count
  turn = 0
  @board.each do |index|
    if index == "X" || index == "O"
      turn += 1
    end
  end
  return turn
end

def current_player
  #if the turn count is an even number, that means O just went, so the next/current player is X
  num_turns = turn_count
  if num_turns % 2 == 0
    player = "X"
  else
    player = "O"
  end
  return player
end

def turn
  puts "Please choose a number 1-9:"
  user_input = gets.chomp
  index = input_to_index(user_input)
  if valid_move?(index)
    player_token = current_player
    move(index, player_token)
    display_board
  else
    turn
  end
end

def won?
  WIN_COMBINATIONS.each {|win_combo|
    index_0 = win_combo[0]
    index_1 = win_combo[1]
    index_2 = win_combo[2]

    position_1 = @board[index_0]
    position_2 = @board[index_1]
    position_3 = @board[index_2]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
    end
  }
  return false
end

def full?
  @board.all? {|index| index == "X" || index == "O"}
end

def draw?
  if !won? && full?
    return true
  else
    return false
  end
end

def over?
  if won? || draw?
    return true
  else
    return false
  end
end

def winner
  index = []
  index = won?
  if index == false
    return nil
  else
    if @board[index[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
end

def play
  until over? == true
    turn
  end

  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end

end




# class TicTacToe
# attr_accessor :board
#
# WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [2,5,8], [1,4,7], [0,4,8],[2,4,6]]
#
# def initialize(board=[" ", " ", " ", " "," ", " ", " ", " ", " "])
#   @board = board
# end
#
#
# def display_board(board = @board)
# puts " #{board[0]} | #{board[1]} | #{board[2]} "
# puts "-----------"
# puts " #{board[3]} | #{board[4]} | #{board[5]} "
# puts "-----------"
# puts " #{board[6]} | #{board[7]} | #{board[8]} "
# end
#
# def input_to_index(user_input)
# user_input = user_input.to_i-1
# end
#
#
# def move(index,value='X')
# @board[index] = value
# end
#
# def position_taken?(board=@board, index)
#   if board[index] == "X" or board[index] =="O"
#     return true
#   elsif board[index] == " " or board[index] == "" or board[index] == nil
#     return false
#   end
#
#   def valid_move?(board = @board, index)
#     if position_taken?(board = @board, index) == true
#       return false
#     elsif index > 8 or index < 0
#       return false
#         else
#             return true
#           end
#   end
#
#   def turn_count
# turn = 0
# @board.each do |i|
#   if i == "X" or i == "O"
#     turn+=1
#   end
# end
# return turn
# end
#
#
# def current_player
# num_turns = turn_count
# if num_turns%2==0
#   player = "X"
# else
#   player = "O"
# end
# return player
# end
#
#
#
#   def turn(board = @board)
#     puts "Please enter 1-9:"
#     input = gets.strip
#     index = input_to_index(input)
#     if valid_move?(board, index)
#       move(board, index)
#       display_board(board)
#     else
#       turn(board)
#     end
#   end
#
#
#
#
# end
#
#
#
#
#
#
#
#
#   def won?(board=@board)
#
#   win_combinations = [[0,1,2], [0,3,6], [0,4,8], [1,4,7],
#   [2,5,8], [2,4,6], [3,4,5], [6,7,8]]
#
#
#   arr = []
#   i = 0
#   while i < board.length
#     if board[i] == "X"
#       arr << i
#   end
#   i+=1
#   end
#
#
#   arrs = []
#   i = 0
#   while i < board.length
#     if board[i] == "O"
#       arrs << i
#   end
#   i+=1
#   end
#
#
#   i = 0
#   while i <= WIN_COMBINATIONS.length
#     if WIN_COMBINATIONS[i] == arr or WIN_COMBINATIONS[i] == arrs
#       return  WIN_COMBINATIONS[i]
#     end
#     i+=1
#   end
#
#
#
#   return false
#
#   end
#   #
#   #
#   #
#   def full?(board=@board)
#     i = 0
#     arr= []
#     while i < board.length
#       if board[i] == "X" or board[i] == "O"
#         arr << 1
#       end
#       i+=1
#     end
#
#     if arr.length == 9 #and won?(board) !=false
#       return true
#     else
#       return false
#     end
#
#
#   end
#
#   #
#   #
#   def draw?(board=@board)
#
#
#     # if full?(board) == true
#     #   return true
#     # else
#     #   return false
#     # end
#
#
#   if full?(board) == false and won?(board) == false
#     return false
#   end
#
#   if [board[0], board[4], board[8]] == ["X", "X", "X"] or [board[0], board[4], board[8]] == ["O", "O", "O"]
#     return nil
#   end
#
#     if [board[2], board[4], board[6]] == ["X", "X", "X"] or [board[2], board[4], board[6]] == ["O", "O", "O"]
#       return nil
#     end
#
#
#   if [board[0], board[1], board[2]] == ["X", "X", "X"] or [board[0], board[1], board[2]] == ["O", "O", "O"]
#     return nil
#   end
#
#   if full?(board) == true
#     return true
#   end
#
#   if won?(board) == true and won?(board) == [0,1,2] #or won?(board) == [1,4,7] or won?(board) == [2,4,6]
#     return false
#   end
#
#     if won?(board)== false and full?(board) == true
#       return true
#     end
#
#   if won?(board) != false
#     return false
#   end
#
#   if full?(board) == false and won?(board) == false
#     return false
#   end
#
#   end
#   #
#   #
#   #
#   #
#
#   def over?(board=@board)
#
#   if won?(board) == true and full?(board) == true
#       return true
#     end
#
#   if draw?(board) == true
#       return true
#     end
#
#   if full?(board) ==false and won?(board) == false
#         return false
#   end
#
#   return true
#
#   end
#
#   #
#   #
#   #
#   def winner(board=@board)
#
#   if board.count{|i| i=="X"} > board.count{|i| i == "O"} and won?(board=@board)
#     return "X"
#   end
#
#   if board.count{|i| i=="O"} == board.count{|i| i == "X"} and won?(board=@board)
#     return "O"
#   end
#
#
#   if won?(board) == false
#     nil
#   end
#
#   end
#   #
#   #
#   #
#
#
#
#
#
# end
