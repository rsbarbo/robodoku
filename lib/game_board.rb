
class GameBoard

  attr_reader :puzzle_path

  def initialize(puzzle_text)
    @puzzle_text = puzzle_text
  end

  def check_for_discrenpancies(puzzle_text)
    puzzle_text.each do |chars|
      raise "ErrorMessage!!! Check number of characters" if chars.length < 9
    end
  end

  def split_numbers(puzzle_text)
    splitted = puzzle_text.map do |row|
      row.chomp.ljust(9, " ").chars
    end
  splitted
  end

  def creating_gameboard
    positioning = Array.new
    row = [*"a".."i"]
    digits = Array.new.push("#" * row.length)[0].split("")
    zipped_digits_rows = row.zip(digits).map! {|zip| zip.join()}
    row.length.times do |rows|
      positioning << zipped_digits_rows.map do |index|
        index.gsub("#", (rows+1).to_s)
      end
      binding.pry
    end

  end

end
