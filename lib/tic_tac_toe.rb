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

  def initialize(board = Array.new(9, " "))
    @board = board
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    @index = input.to_i - 1
  end

  def move(move, character = "X")
    @board[move] = character
  end

  def position_taken?(position)
    @board[position] == "X" || @board[position] == "O"
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    index = input_to_index(gets.strip)

    if !valid_move?(index)
      turn
    else
      move(index, current_player)
      display_board
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combination|
      combo = []
      combo << @board[combination[0]]
      combo << @board[combination[1]]
      combo << @board[combination[2]]

      if(combo.all? { |e| e == "X" })
        return combination
      end

      if(combo.all? { |e| e == "O"})
        return combination
      end
    end
    false
  end

  def full?
    !@board.any? { |e| e == " "}
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    if !won?
      return nil
    end
    @board[won?.first]
  end

  def play
    until over? do
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end
