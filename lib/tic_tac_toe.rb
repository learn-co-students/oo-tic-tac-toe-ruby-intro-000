class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

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
    index.between?(0, 8) && !position_taken?(index)
  end

  def turn_count
    count = 0

    @board.each do |i|
      if i == "X" || i == "O"
        count += 1
      end
    end
    return count
  end

  def current_player
    turns = turn_count()

    if turns % 2 == 0
      player = "X"
    else
      player = "O"
    end

    return player
  end

  def turn
    puts "Pick a number 1-9:"
    user_input = gets.chomp
    index = input_to_index(user_input)

    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      index = gets.chomp
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      if @board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X"
        return win_combination
      elsif @board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O"
        return win_combination
      end
    end
    return false
  end
  
  def full?
    @board.all? {|i| i == "X" || i == "O"}
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
    i = []
    i = won?
    
    if i == false
      return nil
    else
      if @board[i[0]] == "X"
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
