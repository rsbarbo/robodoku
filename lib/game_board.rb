
#create a board
#contain the number of characters needed (up and down - column - in an array)
#contain the number of characters needed (side ways, rows)
#contain a nested array for positions


class GameBoard

  def initialize(puzzle_text)
    @rows = puzzle_text.clone
    @columns = creating_columns(puzzle_text)
    @boxes = []
    @square = []
  end

  def creating_columns(puzzletext)
    columns = []
    0.upto(puzzletext.length - 1) do |n|
    column = []
     puzzletext.each do |row|
       column << row[n]
     end
     columns << column.join("")
    end
    columns
  end

  def creating_boxes
  end

  def final_board
  end

end
