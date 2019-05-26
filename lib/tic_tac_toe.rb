class TicTacToe

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

  def initialize()
    @board = Array.new(9, " ")
  end

  def display_board()
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(square_num)
    square_num.to_i - 1
  end

  def move(index, character)
    @board[index] = character
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    if index.between?(0, 8) == true && position_taken?(index) == false
      return true
    else
      return false
    end
  end

  def turn()
    puts "Please enter 1-9:"
    inputOK = input_to_index(gets.strip)
    if valid_move?(inputOK)
      move(inputOK, current_player())
      display_board()
    else
      if over?() == false
        turn()
      end
    end
  end

  def turn_count()
    turns_taken = @board.select do |val|
      val == "X" || val == "O"
    end
    return turns_taken.length
  end

  def current_player()
    turn_count() % 2 == 0 ? "X" : "O"
  end

  def won?()
    xNums = []
    oNums = []
    x = 0
    while x < @board.length do
      if @board[x] == "X"
        xNums.push(x)
      elsif @board[x] == "O"
        oNums.push(x)
      end
      x += 1
    end
    if won_helper(xNums) != false
      return won_helper(xNums)
    else
      return won_helper(oNums)
    end
  end

  def won_helper(arr)
    r = 0
    c = 0
    winner = 0
    while r < WIN_COMBINATIONS.length #because I can
      while c < WIN_COMBINATIONS[r].length
        if arr.include? WIN_COMBINATIONS[r][c] #because I can
          winner += 1
          if winner == 3
            winning_array = [] #to prevent potential side effect we will return a copy
            x = 0
            while x < WIN_COMBINATIONS[r].length
              winning_array.push(WIN_COMBINATIONS[r][x])
              x += 1
            end
            return winning_array
          else
            c += 1
            next
          end
        end
        c += 1
      end
      c = 0
      r += 1
      winner = 0
    end
    return false
  end

  def full?()
    @board.all? do |val|
      val == "X" || val == "O"
    end
  end

  def draw?()
    full?() && !won?() ? true : false
  end

  def over?()
    if full?() || won?() || draw?()
      return true
    else
      return false
    end
  end

  def winner()
      if won?() != false && @board[won?()[0]] == "X"
      return "X"
    elsif won?() != false && @board[won?()[0]] == "O"
      return "O"
    else
      return nil
    end
  end

  def play()
    while over?() == false do
      turn()
    end
    if won?()
      puts "Congratulations #{winner()}!"
    else
      puts "Cat's Game!"
    end
  end
end
