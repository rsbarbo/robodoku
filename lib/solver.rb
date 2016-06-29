require "pry"
require "./lib/game_board"

class Solver

  # we need to count the number of rows and columns

  def initialize(gameboard)
    @gameboard = gameboard
  end

  def character_counter(sudoku)
    sudoku.size
  end

 #data_structure will hold both columns (position [0] of the
 # array for each line) and rows
 #rows = []
 #puzzle_text.map do |row|
 #rows << row.chomp

  def missing_characters_in_row(sudoku)
    array = []
    highest_number = character_counter(sudoku)
    highest_number.times do
      if !sudoku.chars.include?(highest_number.to_s)
        array.push(highest_number)
      end
      highest_number -= 1
    end
    array
  end

  #create a loop that would iterate through all the rows

  def missing_characters_in_column
    #enter your code here
  end

  #compare up and down for repeated

def solve
  #this is the final method
  #enter your code here
end

end
