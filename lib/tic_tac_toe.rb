class TicTacToe

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

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} \n-----------\n #{@board[3]} | #{@board[4]} | #{@board[5]} \n-----------\n #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    index = input.to_i - 1
  end

  def move(input, character)
    index = input_to_index(input)
    @board[index] = character
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      false
    else
      true
    end
  end

  def valid_move?(index)
    index = index.to_i-1 if index.class == String
    if  !(position_taken?(index)) && index < 10 && index >=0
      true
    else
      false
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.chomp
    index = input_to_index(input)
    valid = valid_move?(index)
    if valid
      move(input, current_player)
    else
      turn
    end
    display_board
  end

  def turn_count
    turns = 0
    @board.each do |element|
      if element == "O" || element == "X"
        turns += 1
      end
    end
    turns
  end

  def current_player
    if turn_count.even?
      "X"
    else
      "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combination|
      win_index_1 = combination[0]
      win_index_2 = combination[1]
      win_index_3 = combination[2]

      positions = [position_1 = @board[win_index_1],
      position_2 = @board[win_index_2],
      position_3 = @board[win_index_3]]

      if positions.all? {|i| i == "X"} || positions.all? {|i| i == "O"}
        return combination
      end
    end
    false
  end

  def full?
    !(@board.any?{|i| i == " "})
  end

  def draw?
    if !(won?) && full?
      true
    else
      false
    end
  end

  def over?
    if won? || draw? || full?
      true
    else
      false
    end
  end

  def winner
    if won?
      combination = won?
      @board[combination[0]]
    else
      nil
    end
  end

  def play
    until over?
      turn
    end

    if won?
      winner == "X" ? puts("Congratulations X!") : puts("Congratulations O!")
    else
      puts "Cats Game!"
    end
  end

end
