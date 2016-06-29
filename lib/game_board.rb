#create a board
#contain the number of characters needed (up and down - column - in an array)
#contain the number of characters needed (side ways, rows)
#contain a nested array for positions

class GameBoard

attr_reader :columns,
            :puzzle_text

  def initialize(puzzle_text)
    @puzzle_text = puzzle_text
    @rows = puzzle_text
    @columns = creating_columns(puzzle_text)
    @boxes = []
    @square = []
  end

  def creating_columns(puzzletext)
    columns = []
    0.upto(puzzletext.length - 1) do |chars_counter|
    column = []
     puzzletext.each do |row|
       column << row[chars_counter]
     end
     columns << column.join("")
    end
    columns
  end

  def positions(columns)
  positioned = Array.new
  assigned_position = "a0"
  columns.each do |square|
    square.split("").each do |position|
      positioned << assigned_position + position
      assigned_position = assigned_position.next
    end
  end
  positioned
  end

  def creating_boxes
  end

  def final_board
  end

end
