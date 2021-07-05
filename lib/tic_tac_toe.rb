class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  user_input= " "
  def input_to_index(user_input)
    user_input=user_input.to_i
    user_input - 1
  end

  def move(index, character)
    @board[index]= character
  end


  def position_taken?(index)
    if @board[index] == "X"
      return true
    elsif @board[index] == "O"
      return true
    elsif @board[index] == " "||""||nil
      return false
    end
  end

  def valid_move?(index)
    if (index.between?(0,8) == true) && (@board[index]== " ")
      return true
    else
      return false
    end
  end

  def turn
    puts "Please enter 1-9:"
    user_input= gets.strip
    index = input_to_index(user_input)
      if valid_move?(index)
         move(index, current_player)
         display_board
      else
        turn
      end
  end


  def turn_count
    counter= 0
    @board.each do |count|
      if count == "X" || count == "O"
      counter +=1
      end
    end
  counter
  end

  def current_player
    count = turn_count
    if count % 2== 0
      "X"
    else
      "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_array|
      if @board[win_array[0]] == "X" && @board[win_array[1]]== "X" && @board[win_array[2]]=="X"||
         @board[win_array[0]] == "O" && @board[win_array[1]]== "O" && @board[win_array[2]]== "O"
        return win_array
      end
    end
    false
  end

  def draw?
    !won? && full?
  end

  def full?
    @board.all? do |index|
      index == "X" || index == "O"
    end
  end


  def over?
      won?||draw?
  end

  def winner
    if won?
      win_array = won?
      @board[win_array[1]]
    elsif draw?
      return nil
    end
  end

  def play
    until  over?
           turn
    end

    if won?!= false
      puts "Congratulations " "#{winner}!"

    elsif draw?
      puts "Cat's Game!"
    end
  end
end
