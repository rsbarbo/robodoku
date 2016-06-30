
class GameBoard

  attr_reader :puzzle_text, :split_numbers,
              :row, :positioning, :zipped_digits_rows

  def initialize(puzzle_text)
    @puzzle_text = puzzle_text
    @row = [*"a".."i"]
    @positioning = []
  end

  def check_for_discrenpancies(puzzle_text)
    puzzle_text.each do |chars|
      chars.gsub!(chars, "ErrorMessage!! Check number of characters") if chars != 9
    end
  end

  def split_numbers(puzzle_text)
    splitted = puzzle_text.map do |row|
      row.chomp.ljust(9, " ").chars
    end
    splitted
  end

  def squares
    position_number = [*"1".."9"]
    position_setup = position_number.each_slice(3).map do |position|
      position.map {|column| column * 9}
    end
    position_setup.join.chars
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
    create_hash_with_values(positioning)
  end

  def create_hash_with_values(positioning)
    values_positioned = Hash.new
    p_assigned = positioning.flatten.zip(squares).map! {|zip| zip.join()}
    n_to_p = p_assigned.zip(split_numbers(puzzle_text).join.chars)
    n_to_p.map do |array|
      values_positioned[array.first] = array.last
    end
    values_positioned
  end

end
