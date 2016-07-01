require "pry"
require "./lib/game_board"

class Solver

  attr_reader :gameboard,
  :board

  def initialize(gameboard)
    @gameboard = gameboard
  end

  def peers
    create_possibilities = [*"1".."9"]
    find_missing = pre_solver.select { |key| pre_solver[key] == " "}
    find_missing.keys.each do |blank|
      result = @board.select do |key|
        (key.chars & blank.chars).any? == true
      end
      result.each { |pair| create_possibilities.delete(pair.first)}
        binding.pry
    end
  end


  def pre_solver
    @board = gameboard.creating_gameboard
  end

  def solve
    peers
  end


end
