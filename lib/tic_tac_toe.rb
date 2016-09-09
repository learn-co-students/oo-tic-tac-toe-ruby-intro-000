
class TicTacToe
  # Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
def initialize
  @board= [" ", " ", " ", " ", " ", " ", " ", " ", " "]
end

def won?
      spotIndx = [0,1,2,3,4,5,6,7,8,9].select do |spot|
          position_taken?(spot)
      end

      if spotIndx==[]
          winingCombo = nil
      else
          winingCombo = WIN_COMBINATIONS.detect do |oneCombo|

              onlyX=oneCombo.all? do |single|
                  spotIndx.include?(single) && @board[single]=="X"
              end

              onlyO=oneCombo.all? do |single|
                  spotIndx.include?(single) && @board[single]=="O"
              end

              [onlyX, onlyO].detect{|i| i}

          end
      end

      if !(winingCombo.nil? || winingCombo == [])
          winingCombo
      else
          false
      end
  end

  def full?
      @board.all? do |spot|
          spot == "X" || spot == "O"
      end
  end

  def draw?
      if !!won?
          false
      else
          full?
      end
  end

  def over?
      !!won? || draw? || full?
  end

  def winner
      if !!won?
          @board[won?[0]]
      else
          nil
      end
  end

  def current_player
      if turn_count%2==0
          "X"
      else
          "O"
      end
  end

  def turn_count
      counter = 0
      @board.each do |spot|
          if spot == "X" || spot == "O"
              counter += 1
          end
      end
      counter
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

  def move(index, current_player="X")
      @board[input_to_index(index)] = current_player
  end

  def position_taken?(location)
      @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
      index=input_to_index(index)
      if(index>-1)
        index.between?(0,8) && !position_taken?(index)
      else
      false
    end
  end

  def turn
      puts "Please enter 1-9:"
      input = gets.strip
      if valid_move?(input)
          move(input, current_player)
          display_board
      else
          turn #self called!
      end
  end

  # Define your play method below
  def play
      until over? do
          turn
      end
      if !!won?
          puts "Congratulations #{winner}!"
      else
          puts "Cats Game!"
      end
  end
end
