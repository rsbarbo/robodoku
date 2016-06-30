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
    skip
    assert_equal "", gameboard.check_for_discrenpancies(["   26 7 1", "68   7  9", "19   4  5", "82  1   4", "   46 2 9", " 5   3 28", "  93   74", " 4  5  36", "7 3 1   8"])
  end

  def test_creating_columns
    result = [[" ", " ", " ", "2", "6", " ", "7", " ", "1"], ["6", "8", " ", " ", " ", "7", " ", " ", "9"], ["1", "9", " ", " ", " ", "4", " ", " ", "5"], ["8", "2", " ", " ", "1", " ", " ", " ", "4"], [" ", " ", " ", "4", "6", " ", "2", " ", "9"], [" ", "5", " ", " ", " ", "3", " ", "2", "8"], [" ", " ", "9", "3", " ", " ", " ", "7", "4"], [" ", "4", " ", " ", "5", " ", " ", "3", "6"], ["7", " ", "3", " ", "1", " ", " ", " ", "8"]]
    assert_equal result, gameboard.split_numbers(puzzle_text)
  end


    def test_creating_columns
      result = [[" ", " ", " ", "2", "6", " ", "7", " ", "1"], ["6", "8", " ", " ", " ", "7", " ", " ", "9"], ["1", "9", " ", " ", " ", "4", " ", " ", "5"], ["8", "2", " ", " ", "1", " ", " ", " ", "4"], [" ", " ", " ", "4", "6", " ", "2", " ", "9"], [" ", "5", " ", " ", " ", "3", " ", "2", "8"], [" ", " ", "9", "3", " ", " ", " ", "7", "4"], [" ", "4", " ", " ", "5", " ", " ", "3", "6"], ["7", " ", "3", " ", "1", " ", " ", " ", "8"]]
      assert_equal result, gameboard.creating_gameboard
    end

end
