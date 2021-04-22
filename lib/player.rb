class Player

  attr_accessor :name, :mark

    def initialize(mark) 
        @name = nil       
        @mark = mark
    end 
    
    def display_player
        puts "It was created player #{@name} with mark #{@mark}.\n"
    end
    
    
    
end