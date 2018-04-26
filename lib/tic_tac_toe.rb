class TicTacToe
  WIN_COMBINATIONS =
  [
    [0,1,2],
    [3,4,5],
    [6,7,8],

    [0,3,6],
    [1,4,7],
    [2,5,8],

    [0,4,8],
    [2,4,6]
  ]

  def initialize(board = nil)
    board = Array.new(9, " ")
    @board = board
  end

  def won?

    WIN_COMBINATIONS.each do |win_index|
        win_index_1 = win_index[0]
        win_index_2 = win_index[1]
        win_index_3 = win_index[2]

        board_position_1 = @board[win_index_1]
        board_position_2 = @board[win_index_2]
        board_position_3 = @board[win_index_3]

        if board_position_1 =="X" && board_position_2 == "X" && board_position_3 =="X"
          return win_index
        elsif board_position_1 =="O" && board_position_2 == "O" && board_position_3 =="O"
          return win_index
        end
    end
    return false
  end


  def full?
    @board.none? do |position|
      position == nil || position == " "
    end
  end

  def draw?
  won = won?
  full = full?

    if won == false && full == true
      return true
    elsif won == false && full == false
      return false
    elsif won == true
      return false
    end

  end



  def over?
    if won? || draw? || full?
      return true
    end
  end

  def winner
    winner = won?
    if winner != false
      return "#{@board[winner[0]]}"
    end
    return nil
  end

  def turn_count
  counter = 0
    @board.each do |numba|
      if numba == "X" || numba == "O"
        counter +=1
      end
    end
  return counter
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end


  def play
    max_turns = 0

    until max_turns == 9
        draw = draw?
        won = won?
        over = over?

        if draw
          puts "Cat's Game!"
          break
        elsif won
          puts "Congratulations #{@board[won?[0]]}!"
          break
        elsif over
          break
        end

        turn
        max_turns += 1
    end

  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)

    if valid_move?(index)
      player_token = current_player
      move(index, player_token)
      display_board

    else
      turn
    end

  end

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

  def move(index, player_token)

    @board[index] = player_token
  end

  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      return true
    else
      return false
    end
  end

  def valid_move?(index)
    index.between?(0,8) && position_taken?(index) == false
  end


end
