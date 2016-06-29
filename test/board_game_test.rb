require "minitest"
require "minitest/autorun"
require "./lib/game_board"

class GameBoardTest < Minitest::Test

  def test_creating_columns
    assert_equal "", GameBoard.new()
  end

end
