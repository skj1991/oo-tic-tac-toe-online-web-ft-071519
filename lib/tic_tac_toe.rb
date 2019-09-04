require "pry"
class TicTacToe

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(string)
    string.to_i - 1
  end

  def move(index, player="X")
   #index = input_to_index(index)
   @board[index] = player
 end

 def position_taken?(index)
   @board[index] != " "
 end

 def valid_move?(index)
   !position_taken?(index) && index.between?(0,8)
 end

 def turn
   user_input = gets.chomp
   index = input_to_index(user_input)
   if valid_move?(index)
     move(index, current_player)
     display_board
   else
     puts 'you can\'t do that, please try again'
     turn
   end
 end

 def won?
   WIN_COMBINATIONS.each do |win_combo|
     if (@board[win_combo[0]] == @board[win_combo[1]] && @board[win_combo[2]] == @board[win_combo[1]]) && @board[win_combo[0]] != " "
       return win_combo
     end
   end
   false
 end

 def full?
   @board.all? do |val|
     val != " "
   end
 end

 def draw?
   full? && !won?
 end
 def over?
   draw? || won?
 end

 def winner
   results = won?
   if results
     @board[results.first]
   end
 end

 def play
   unless over? == true
     turn
   end
  if won?
     puts "Congratulations #{winner}!"
   else draw?
     puts "Cat's Game!"
   end
 end

end
