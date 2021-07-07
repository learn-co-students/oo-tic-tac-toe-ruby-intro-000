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

  def input_to_index(input)
    index = (input.to_i - 1)
  end

  def move(index, current_player = "X")
    @board[index] = current_player
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ") #if either of these are true, then it is FALSE. (not taken)
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index) # TRUE if BOTH move is on board and if position is NOT taken (true that it is false)
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

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

  def won?
    WIN_COMBINATIONS.each do |wincombo|
      if (@board[wincombo[0]]) == "X" && (@board[wincombo[1]]) == "X" && (@board[wincombo[2]]) == "X"
        return wincombo
      elsif (@board[wincombo[0]]) == "O" && (@board[wincombo[1]]) == "O" && (@board[wincombo[2]]) == "O"
        return wincombo
      end
    end
    return false
  end


  def full?
    @board.none? {|positions| positions == " "}  #returns true if none of the positions are " " aka empty. meaning full.
  end

  def draw?
    if won? == false && full? == true
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
    player = won? #just setting the wincombo array from before to new variable
    if player #is true (aka array for winning combo was returned because someone won. otherwise would be false if no winner)
      if @board[player[0]] == "X" #we already know that that is the winning combo positions so use that to index into the board to see what the value was at that position
        return "X"
      elsif @board[player[0]] == "O"
        return "O"
      end
    end
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def play
    total_turns = 0
    while total_turns < 9
      if over?
        if won?
          puts "Congratulations #{winner}!"
        elsif draw? || full?
          puts "Cat's Game!"
        end
        return
      end
      turn
      total_turns += 1
    end
  end
end
