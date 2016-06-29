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
    @puzzle_path = "./sudoku.txt"
    @puzzle_text = File.readlines(puzzle_path).map(&:chomp)
    @gameboard = GameBoard.new(puzzle_text)
  end

  def test_creating_columns
    result = [" 73192546", "219645387", "654387129", "567428913", "932561478", "481973265", "398216754", "146759832", "725834691"]
    assert_equal result, gameboard.creating_columns(puzzle_text)
  end

  def test_positons
    result = ["a0 ", "a17", "a23", "a31", "a49", "a52", "a65", "a74", "a86", "a92", "b01", "b19", "b26", "b34", "b45", "b53", "b68", "b77"]
    assert_equal result, gameboard.positions([" 73192546", "219645387"])
  end

end
