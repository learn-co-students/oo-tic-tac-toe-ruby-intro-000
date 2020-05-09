class TicTacToe
  WIN_COMBINATIONS= [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8]
  ]
  def initialize
    @board= [" "," "," "," "," "," "," "," "," "]
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1= win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      if @board[win_index_3] == @board[win_index_2] && @board[win_index_2] == @board[win_index_1] && (@board[win_index_1] == "X" || @board[win_index_1]=="O")
        return win_combination
      end
    end
    return false
  end

  def full?
    !(@board.include?(" "))
  end

  def draw?
    !(won?) && full?
  end

  def over?
    draw? || won?
  end

  def winner
    result= won?
    if result
      return @board[result[0]]
    end
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input= input.to_i
    index=input -1
    @current_spot=index
  end

  def turn
    puts "Please enter 1-9:"
    choice=gets.strip
    choice=input_to_index(choice)
    if valid_move?(choice)
      player=current_player
      move(choice, player)
      display_board
    else
      turn
    end
  end

  def move(index, player)
    @board[index]=player
  end

  def position_taken?(choice)
    @board[choice] != " "
  end

  def valid_move?(choice)
    choice.between?(0,8) && !position_taken?(choice)
  end

  def turn_count
    level=0
    @board.each do |spot|
      if spot == "X" || spot =="O"
        level += 1
      end
    end
    return level
  end

  def current_player
    player = ""
    level = turn_count
    if level % 2 == 0
      player = "X"
    else
      player= "O"
    end
    player
  end

  def play
    while !(over?) do
      turn
    end
    if won?
      champ= winner
      puts "Congratulations #{champ}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
