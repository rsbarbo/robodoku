require "minitest"
require "minitest/autorun"
require "./lib/game_board"
require "./lib/solver"
require "./lib/sudoku"
require "pry"


class GameBoardTest < Minitest::Test

  attr_reader :puzzle_path,
              :puzzle_text,
              :gameboard

  def setup
    @puzzle_path = "./puzzles/easy.txt"
    @puzzle_text = File.readlines(puzzle_path).map(&:chomp)
    @gameboard = GameBoard.new(puzzle_text)
  end

  def test_check_for_discrepancies
    errormessage = ["ErrorMessage!! Check number of characters", "ErrorMessage!! Check number of characters", "ErrorMessage!! Check number of characters"]
    assert_equal errormessage, gameboard.check_for_discrenpancies(["   26 7 1", "68   7  9", "19   4  5"])
  end

  def test_splitting_numbers
    result = [[" ", " ", " ", "2", "6", " ", "7", " ", "1"], ["6", "8", " ", " ", " ", "7", " ", " ", "9"], ["1", "9", " ", " ", " ", "4", " ", " ", "5"], ["8", "2", " ", " ", "1", " ", " ", " ", "4"], [" ", " ", " ", "4", "6", " ", "2", " ", "9"], [" ", "5", " ", " ", " ", "3", " ", "2", "8"], [" ", " ", "9", "3", " ", " ", " ", "7", "4"], [" ", "4", " ", " ", "5", " ", " ", "3", "6"], ["7", " ", "3", " ", "1", " ", " ", " ", "8"]]
    assert_equal result, gameboard.split_numbers(puzzle_text)
  end

  def test_squares
    result = ["1", "1", "1", "1", "1", "1", "1", "1", "1", "2", "2", "2", "2", "2", "2", "2", "2", "2", "3", "3", "3", "3", "3", "3", "3", "3", "3", "4", "4", "4", "4", "4", "4", "4", "4", "4", "5", "5", "5", "5", "5", "5", "5", "5", "5", "6", "6", "6", "6", "6", "6", "6", "6", "6", "7", "7", "7", "7", "7", "7", "7", "7", "7", "8", "8", "8", "8", "8", "8", "8", "8", "8", "9", "9", "9", "9", "9", "9", "9", "9", "9"]
    assert_equal result, gameboard.squares
  end

  def test_creating_columns
    result_hash = {"a11"=>" ", "b11"=>" ", "c11"=>" ", "d11"=>"2", "e11"=>"6", "f11"=>" ", "g11"=>"7", "h11"=>" ", "i11"=>"1", "a22"=>"6", "b22"=>"8", "c22"=>" ", "d22"=>" ", "e22"=>" ", "f22"=>"7", "g22"=>" ", "h22"=>" ", "i22"=>"9", "a33"=>"1", "b33"=>"9", "c33"=>" ", "d33"=>" ", "e33"=>" ", "f33"=>"4", "g33"=>" ", "h33"=>" ", "i33"=>"5", "a44"=>"8", "b44"=>"2", "c44"=>" ", "d44"=>" ", "e44"=>"1", "f44"=>" ", "g44"=>" ", "h44"=>" ", "i44"=>"4", "a55"=>" ", "b55"=>" ", "c55"=>" ", "d55"=>"4", "e55"=>"6", "f55"=>" ", "g55"=>"2", "h55"=>" ", "i55"=>"9", "a66"=>" ", "b66"=>"5", "c66"=>" ", "d66"=>" ", "e66"=>" ", "f66"=>"3", "g66"=>" ", "h66"=>"2", "i66"=>"8", "a77"=>" ", "b77"=>" ", "c77"=>"9", "d77"=>"3", "e77"=>" ", "f77"=>" ", "g77"=>" ", "h77"=>"7", "i77"=>"4", "a88"=>" ", "b88"=>"4", "c88"=>" ", "d88"=>" ", "e88"=>"5", "f88"=>" ", "g88"=>" ", "h88"=>"3", "i88"=>"6", "a99"=>"7", "b99"=>" ", "c99"=>"3", "d99"=>" ", "e99"=>"1", "f99"=>" ", "g99"=>" ", "h99"=>" ", "i99"=>"8"}
    assert_equal result_hash, gameboard.creating_gameboard
  end

  def test_row_length_equals_nice
    gameboard.split_numbers(puzzle_text)
    assert_equal 9, gameboard.row.length
  end

  def test_create_hash_with_values
    nested_array = [["a1", "b1", "c1", "d1", "e1", "f1", "g1", "h1", "i1"],["a2", "b2", "c2", "d2", "e2", "f2", "g2", "h2", "i2"]]
    result = {"a11"=>" ", "b11"=>" ", "c11"=>" ", "d11"=>"2", "e11"=>"6", "f11"=>" ", "g11"=>"7", "h11"=>" ", "i11"=>"1", "a22"=>"6", "b22"=>"8", "c22"=>" ", "d22"=>" ", "e22"=>" ", "f22"=>"7", "g22"=>" ", "h22"=>" ", "i22"=>"9"}
    assert_equal result, gameboard.create_hash_with_values(nested_array)
  end

end
