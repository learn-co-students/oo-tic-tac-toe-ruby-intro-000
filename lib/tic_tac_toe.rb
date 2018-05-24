class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end
  def play()
    until over?()
      turn()
      if draw?()
        break
      end
    end
    if won?()
      puts "Congratulations #{winner()}!"
    elsif draw?()
      puts "Cat's Game!"
    end
  end
  def turn()
    puts "Please enter 1-9:"
    input = gets.chomp
    #input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      current_player = current_player()
      move(index, current_player)
      display_board()
    else
      turn()
    end
  end
  def display_board()
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  #def move(board, index, current_player = "X")
  def move(index, current_player)
    @board[index] = current_player
    #@board[index] = current_player(board)
  end
  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " " || @board[index] == "")
  end
  def turn_count()
    turn = 0
    @board.each do |space|
      if space == "X" or space == "O"
        turn += 1
      end
    end
    turn
  end
  def current_player()
    turn_count() % 2 == 0 ? "X" : "O"
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
  def won?()
    WIN_COMBINATIONS.select do |row|
      if position_taken?(row[0]) && @board[row[0]] == @board[row[1]] && @board[row[1]] == @board[row[2]]
        return row
      end
    end
    return false
  end
  def full?()
    WIN_COMBINATIONS.select do |row|
      row.select do |element|
        if !position_taken?(element)
          return false
        end
      end
    end
  true
  end
  def draw?()
    !won?() && full?()
  end
  def over?()
    won?() || full?()
  end
  def winner()
    if won?().is_a?(Array)
      return @board[won?()[0]]
    else
      return nil
    end
  end
end
