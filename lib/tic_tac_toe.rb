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

  def input_to_index(user_input)
    @index = user_input.to_i - 1
  end

  def turn_count
    @board.count{ |token| token == "X" || token == "O" }
  end

  def move(index, token = "X")
    @token = token
    @index = index
    @board[@index.to_i] = token
  end

  def position_taken?(index)
    if @board[index] == " "
      false
    elsif @board[index] == ""
      false
    elsif @board[index] == nil
      false
    elsif @board[index] == "X"
      true
    elsif @board[index] == "O"
      true
    end
  end
  

  def valid_move?(index)
    if position_taken?(index) == false && index.between?(0, 8)
      true
    else
      false
    end
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    input_to_index(user_input)
    if valid_move?(@index) == true && current_player == "X"
        move(@index, @token = "X")
        display_board
    elsif valid_move?(@index) == true && current_player == "O"
        move(@index, @token = "O")
        display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_array|
      if @board[win_array[0]] == "X" && @board[win_array[1]] == "X" && @board[win_array[2]] == "X"
        return win_array
      elsif @board[win_array[0]] == "O" && @board[win_array[1]] == "O" && @board[win_array[2]] == "O"
        return win_array
      end
    end
    return false
  end

  def full?
    if @board.include?(" ")
      false
    else
      true
    end
  end

  def draw?
    if won? == false && full? == true
      true
    else
      false
    end
  end

  def over?
    if won? == true || draw? == true || full? == true
      true
    else
      false
    end
  end

  def winner
      WIN_COMBINATIONS.each do |win_array|
        if @board[win_array[0]] == "X" && @board[win_array[1]] == "X" && @board[win_array[2]] == "X"
          return "X"
        elsif @board[win_array[0]] == "O" && @board[win_array[1]] == "O" && @board[win_array[2]] == "O"
          return "O"
        end
      end
      if won? == false
        nil
      end
    end

    def play
      if won?
        puts "Congratulations #{winner}!"
      elsif draw? == true
        puts "Cat's Game!"
      elsif over? == false
        turn
        play
      elsif over? == true
      end
    end

end
