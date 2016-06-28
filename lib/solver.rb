require "pry"

class Solver

  # we need to count the number of rows and columns

  def character_counter(sudoku)
    sudoku.size
  end

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

  def missing_characters_in_column

  end



  #compare up and down for repeated

end
