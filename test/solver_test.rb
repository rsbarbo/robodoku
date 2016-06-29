require "minitest"
require "minitest/autorun"
require "./lib/solver"

class SolverTest < Minitest::Test

  def test_read_file_per_line

  end

  def test_counts_characters
    assert_equal 2, Solver.new.character_counter("12")
  end

  def test_missing_characters_in_row
    assert_equal [1], Solver.new.missing_characters_in_row(" 2")
  end

  def test_missing_characters_in_rows
    assert_equal [2], Solver.new.missing_characters_in_row("1 ")
  end

  def test_missing_characters_in_column
    skip
    assert_equal [1], Solver.new.missing_characters_in_column(" 2", "21")
  end


end
