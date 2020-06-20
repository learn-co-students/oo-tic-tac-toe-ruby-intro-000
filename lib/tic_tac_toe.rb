class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def display_board # This is how we create a board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index2   #This will strings into numbers which is useful for inputs that come from the user
    input=gets.strip
    input.to_i-1
  end

  def input_to_index(user_input)
  user_input.to_i-1
  end

  #This uses the current player to put on a board that we have created. We still need to supply board and index
  def move(index, current_player)
    @board[index] = current_player
  end

  #This function will access if the position on the board is empty or not
  def position_taken? (index)
    @board[index] != " " && @board[index] !=""
  end

  def valid_move? (index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    user_input=gets.strip
    index= input_to_index(user_input)
    if valid_move?(index)
      move(index,current_player)
      display_board
    else
      turn
    end
  end

  #This line divides the two parts of this game. The above the dynamics of motion for this game
  #The below is the play method which is at the bottom. The other methods evaluate whether or not the game has been won
  #The winning combinations are all hard coded into the game since we have to determine all scenarios that the game has resulted in winning


  def define_win(win_combination)
    if @board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X"
      return win_combination # return the win_combination indexes that won.
    elsif @board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O"
      return win_combination # return the win_combination indexes that won.
    else
      false
    end
  end
  top_row_win=[0,1,2]
  mid_row_win=[3,4,5]
  bot_row_win=[6,7,8]
  left_col_win=[0,3,6]
  mid_col_win=[1,4,7]
  right_col_win=[2,5,8]
  left_right_win=[0,4,8]
  right_left_win=[2,4,6]
  WIN_COMBINATIONS=[top_row_win,mid_row_win,bot_row_win,left_col_win,mid_col_win,right_col_win,left_right_win,right_left_win]
  def iswin
    win=false
    WIN_COMBINATIONS.each do|slot|
      win=define_win(slot) if define_win(slot) !=false
    end
    win
  end

  def won?   #The method below will return an array for a board with a winning outcome and false for everything else
    won=false
    if iswin!=false
      won=iswin
    else
      won=false
    end
    won
  end

  def full? #This method checks if the board is full by checking if all the spots in the array is no longer empty
    @board.all?{|token| token=="X"||token=="O"}
  end

    def draw? #draws only happens on completed boards
    full? && !won?
  end

  def over?#The game is over when someone has won or draw
    draw? || won?
  end

  def winner
    if won?
      @board[won?[2]]
    else
    end
  end

  def play
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    elsif !over?
      turn
      play
    end
  end

end
