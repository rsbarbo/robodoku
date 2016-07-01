require "minitest"
require "minitest/autorun"
require "./lib/solver"


class SolverTest < Minitest::Test

  attr_reader :solver, :gameboard, :puzzle_path, :puzzle_text

  def setup
    @puzzle_path = "./puzzles/nine_by_nine_trivial.txt"
    @puzzle_text = File.readlines(puzzle_path).map(&:chomp)
    @gameboard = GameBoard.new(puzzle_text)
    @solver = Solver.new(gameboard)
  end

  def test_read_file_per_line
    assert_equal "", solver.method_will_compare_with_something
  end


end
