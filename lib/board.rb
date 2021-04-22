class Board

  attr_accessor :board, :row

  BOTTOM = 5
  EMPTY = "\u2609"
   
  def initialize
    @board = Array.new(6) { Array.new(7, EMPTY)}  
  end

  def display_board
    @board.each { |x|
    puts x.join(" ")
    }
  end 
  
  def good_column?(column)
    if column =~ /^-?[0-9]+$/ 
      column_int = column.to_i - 1     
      return true if (0..6).include?(column_int)  
    end    
    false   
    
  end  

  def full?    
     @board.flatten.all?{|elem|elem != EMPTY}    
  end

  def declare_full
    if full?
      puts "Board is full! No one wins!"  
    end
  end

  def get_column(name)
    puts "\n #{name} type the column."   
    column = gets.chomp       
  end  

  def switch_row
    @row = BOTTOM
    while @board[@row][@column] != EMPTY && @row >= 0 do
      @row -= 1      
    end
    
  end

  def fill_board(name, mark) 
    column = get_column(name)

    while good_column?(column) == false || @board.flatten.length > 42 do 
      puts "Invalid input. Type another column"  
      column = get_column(name)       
    end

    @column = column.to_i - 1
    fill_array(mark)   
    
  end

  def outcome_win(name, mark)
    fill_board(name, mark)    
    display_board
    win?(name, mark)
  end

  def fill_array(mark)    
    switch_row    
    @board[@row][@column] = mark    
  end

  def win?(name, mark)
     if four_in_column?(mark)     
        puts "#{name} you have four in a column. You win!" 
        return true     
     elsif four_in_row?(mark)
        puts "#{name} you have four in a row. You win!" 
        return true       
     elsif four_in_diagonal?(mark)
        puts "#{name} you have four in a diagonal. You win!" 
        return true       
     end        
     false
  end

  def four_in_column?(mark)
    5.downto(3) do |i|
      if @board[i][@column] == mark && @board[i-1][@column] == mark && @board[i-2][@column] == mark && @board[i-3][@column] == mark
        return true
      end
    end
    false
  end

  def four_in_row?(mark)    
    0.upto(6) do |i|      
      if @board[@row][i] == mark && @board[@row][i+1] == mark && @board[@row][i+2] == mark && @board[@row][i+3] == mark 
        return true
      end
    end

    false
  end

  def four_in_diagonal?(mark)
    3.upto(5) do |i|
      0.upto(3) do |j|      
        if @board[i][j] == mark && @board[i-1][j+1] == mark && @board[i-2][j+2] == mark && @board[i-3][j+3] == mark 
          return true 
        end
      end
    end

    0.upto(2) do |i|
      0.upto(3) do |j|
        if @board[i][j]== mark && @board[i+1][j+1]== mark && @board[i+2][j+2]== mark && @board[i+3][j+3]== mark
          return true
        end
      end
    end
    
    false
  end

end