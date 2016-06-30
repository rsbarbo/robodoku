
class GameBoard

  attr_reader :puzzle_text, :split_numbers,
              :row, :positioning, :zipped_digits_rows

  def initialize(puzzle_text)
    @puzzle_text = puzzle_text
    @row = [*"a".."i"]
    @positioning = Array.new
  end

  #needs to make sure this is working properly
  def check_for_discrenpancies(puzzle_text)
    puzzle_text.each do |chars|
      print "ErrorMessage!! Check number of characters" if chars.length < 9
    end
  end

  def split_numbers(puzzle_text)
    splitted = puzzle_text.map do |row|
      row.chomp.ljust(9, " ").chars
    end
    splitted
  end

  def creating_gameboard
    digits = Array.new.push("#" * row.length)[0].split("")
    @zipped_digits_rows = row.zip(digits).map! do |zip|
      zip.join()
    end
    create_positioning
  end

    def create_positioning
    row.length.times do |rows|
      positioning << zipped_digits_rows.map do |index|
        index.gsub("#", (rows+1).to_s)
      end
    end
    final_positions = positioning.flatten.zip(square).map! {|zip| zip.join()}
    board_with_values = final_positions.zip(split_numbers(puzzle_text).join.chars)
    @final_board = board_with_values.reduce(Hash.new) do |hash, array|
      hash[array[0]] = array[1]
      hash
    end
  end

  def square
    letters = [*"1".."9"]
    square = letters.each_slice(3).map do |slice|
      slice.map do |c|
        (c * 3) * 3
      end
    end.join.chars

  end

end
