class TicTacToe


  def initialize(board=nil)
    @board=Array.new(9," ")
  end
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
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  def input_to_index(user_input)
  index = user_input.to_i
  index -= 1
  return index
  end
  def valid_move?( index)
  index.between?(0,8) && !position_taken?(index)
  end
  #turn_count
  def turn_count
  @board.count{|token| token=="X"||token=="O"}
  end
  def current_player
  turn_count % 2 == 0 ? "X" : "O"
  end



  #Takes a users num and the board, and places the X or O char in that position
  def move( index, current_player)
  @board[index] = current_player
  end

  def position_taken?( location)
  @board[location] != " " && @board[location] != ""
  end


  #turn
  def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
    if valid_move?(index)

       move(index, current_player)

       display_board
    else
      turn
    end
  end
  #won?
  def won?

    WIN_COMBINATIONS.each{|win_combination|
    # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
    # grab each index from the win_combination that composes a win.
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = @board[win_index_1] # load the value of the board at win_index_1
    position_2 = @board[win_index_2] # load the value of the board at win_index_2
    position_3 = @board[win_index_3] # load the value of the board at win_index_3

      if position_1 == "O" && position_2 == "O" && position_3 == "O"
        return  win_combination# return the win_combination indexes that won.
      elsif position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      end
       }
      return false


  end
  #full?
  def full?
    @board.all?{|input| input=="O"||input=="X"}
  end

  #draw?
  def draw?

    if !won? && full?
      true
    else
      false

    end

  end

  #over?
  def over?
   if won? || full? || draw?
     true
  else
     false
   end
  end


    #winner
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

  #play
  def play
    counter = 0
    until counter == 9
      turn
      counter += 1
    end
  end
  def play
  until over?
    turn
  end
  end


  def play


    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)


        move(0, "X")
        move(1, "O")
        move(2, "X")

      display_board
    else
      turn
    end




  end





  def play
  until over?
    turn
  end

  if won?
    if winner=="X"
      puts "Congratulations X!"
    else
      puts "Congratulations O!"

    end


  elsif draw?
    puts"Cat's Game!"
  end
end














end





#Asks user for a number, check if it is valid, and if it's not, recursively continues to ask for a number
