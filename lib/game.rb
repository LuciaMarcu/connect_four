require_relative 'player.rb'
require_relative 'board.rb'

class Game

  attr_accessor :player_one, :player_two

  def initialize
    @board = Board.new
    @player_one = Player.new('X')
    @player_two = Player.new('0')
  end

  def welcome
      puts "This is Connect Four.This is the board.\n"
      @board.display_board
      puts "You will take turns choosing a column to put your mark into this seven-column, six-row vertical grid. Your mark will occupy the lowest available space within the column. The objective of the game is to be the first to form a horizontal, vertical or diagonal line of four of one's own mark.\n"    
  end 

  
  def name_player(player)
    if @player_one.name.nil?
      puts "First player has to type a name." 
    else
      puts "Now second player will type a name."
    end       
    name = gets.chomp
    player.name = name
    player.display_player
  end

  def start_game
    welcome
    name_player(@player_one)  
    name_player(@player_two)
  end
  

  def play_game 
    until @board.full? do      
      break if @board.outcome_win(@player_one.name, @player_one.mark) 
      break if @board.outcome_win(@player_two.name, @player_two.mark)   
    end
    @board.declare_full
  end

  

end