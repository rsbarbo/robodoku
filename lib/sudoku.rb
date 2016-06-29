require "./lib/solver"
require "./lib/game_board"

puzzle_path = ARGV[0]
puzzle_text = File.readlines(puzzle_path).map(&:chomp)
gameboard = GameBoard.new(puzzle_text)
binding.pry
# solver = Solver.new(gameboard)
# puts solver.solve
