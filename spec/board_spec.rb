require_relative '../lib/board'

describe Board do
    subject(:board_one) { described_class.new }

    describe '#initialize' do
        it 'creates an empty array of length 6' do
            result = board_one.board.length
            expect(result).to eq(6)
        end

        it 'each containing array has a length of 7' do
            result = board_one.board.all?{|arr| arr.length == 7}
            expect(result).to eq true
        end        

    end

    describe '#good_column?' do
        
        it 'should return true when column is in range' do
            result = board_one.good_column?('4')
            expect(result).to eq true
        end

        it 'should return false when column is out of range' do
            result = board_one.good_column?('8')            
            expect(result).to eq false
        end        

        it 'should return false when column is not a number' do
            result = board_one.good_column?(',')            
            expect(result).to eq false
        end
        
    end

    describe '#full?' do        

        it 'should return false if board is empty' do
            result = board_one.full?
            expect(result).to eq false
        end

        it 'should return true if board is full' do
            board_one.board.each_with_index do |row, index_row|
                row.each_with_index do |column, index_column|
                  board_one.board[index_row][index_column] = 'x'
                end
            end
            result = board_one.full?
            expect(result).to eq true

        end

        it 'should return false if board is partially filled' do
            board_one.board[1][4] = 'x'
            board_one.board[2][3] = '0'
            result = board_one.full?
            expect(result).to eq false
        
        end
    end     
    
    describe 'four_in_column?' do       

        it "should return true if there are 4 'x' in column number 0" do
            board_one.board[5][0] = 'x'
            board_one.board[4][0] = 'x'
            board_one.board[3][0] = 'x'
            board_one.board[2][0] = 'x'            
            board_one.column = 0
            result = board_one.four_in_column?('x')
            expect(result).to eq true
        end

        it "should return false if there are not all 4 'x' in column number 0" do
            board_one.board[5][0] = '0'
            board_one.board[4][0] = 'x'
            board_one.board[3][0] = 'x'
            board_one.board[2][0] = 'x'            
            board_one.column = 0
            result = board_one.four_in_column?('x')
            expect(result).to eq false
        end

        it 'should return false if there are not 4 in column number 3' do                      
            board_one.column = 3
            result = board_one.four_in_column?('x')
            expect(result).to eq false
        end


    end

    describe 'four_in_row?' do    
        it "should return true if there are 4 'x' in row number 3" do 
            board_one.board[3][0] = 'x'
            board_one.board[3][1] = 'x'
            board_one.board[3][2] = 'x'
            board_one.board[3][3] = 'x'            
            board_one.row = 3
            result = board_one.four_in_row?('x')
            expect(result).to eq true
        end

        it "should return false if there are not all 4 'x' in row number 3" do 
            board_one.board[3][0] = 'x'
            board_one.board[3][1] = 'x'
            board_one.board[3][2] = '0'
            board_one.board[3][3] = 'x'            
            board_one.row = 3
            result = board_one.four_in_row?('x')
            expect(result).to eq false
        end

        it "should return false if there are not 4 'x' in row number 1" do                      
            board_one.column = 1
            result = board_one.four_in_column?('x')
            expect(result).to eq false
        end

    end

    describe 'four_in_diagonal?' do
        it "should return true if there are 4 'x' in a diagonal" do 
            board_one.board[2][3] = 'x'
            board_one.board[3][2] = 'x'
            board_one.board[4][1] = 'x'
            board_one.board[5][0] = 'x'            
            result = board_one.four_in_diagonal?('x')
            expect(result).to eq true
        end

        it "should return true if there are 4 'x' in a diagonal" do 
            board_one.board[3][3] = 'x'
            board_one.board[2][2] = 'x'
            board_one.board[1][1] = 'x'
            board_one.board[0][0] = 'x'            
            result = board_one.four_in_diagonal?('x')
            expect(result).to eq true
        end

        it "should return false if there are not all 4 'x' in a diagonal" do 
            board_one.board[3][3] = 'x'
            board_one.board[2][2] = 'x'
            board_one.board[1][1] = '0'
            board_one.board[0][0] = 'x'            
            result = board_one.four_in_diagonal?('x')
            expect(result).to eq false
        end

        it "should return false if there are not 4 'x' in any diagonal" do
            result = board_one.four_in_diagonal?('x')
            expect(result).to eq false
        end
    end

    

end