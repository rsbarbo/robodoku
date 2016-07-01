
class GameBoard

  attr_reader :split_numbers,
              :row,
              :positioning,
              :zipped_digits_rows,
              :puzzle_text

  def initialize(puzzle_text)
    @puzzle_text = puzzle_text
  end

  def split_numbers(puzzle_text)
    splitted = puzzle_text.map do |row|
      row.chomp.ljust(9, " ").chars
    end
    splitted
  end

  def squares
    position_number = [*"1".."6"]
    position_setup = []
    position_setup = position_number.each_slice(3).map do |position|
      position.map {|column| (column * 3)} * 3
    end
    position_setup.join.chars
  end

  def creating_gameboard
    @positioning = []
    @row = [*"a".."i"]
    digits = Array.new.push("#" * row.length)[0].split("")
    @zipped_digits_rows = row.zip(digits).map do |zip|
      zip.join()
    end
    create_positioning
  end

  def create_positioning
    row.length.times do |r|
      positioning << zipped_digits_rows.map do |index|
        index.gsub("#", (r+1).to_s)
      end
    end
    create_hash_with_values
  end

  def create_hash_with_values
    values_positioned = Hash.new
    p_assigned = positioning.flatten.zip(squares).map {|zip| zip.join()}
    num_to_pos = p_assigned.zip(split_numbers(puzzle_text).join.chars)
    num_to_pos.map do |array|
      values_positioned[array.first] = array.last
    end
    values_positioned
  end

  def check_for_discrenpancies(puzzle_text)
    puzzle_text.each do |chars|
      chars.gsub!(chars, "ErrorMessage!! Check number of characters") if chars != 9
    end
  end

end
