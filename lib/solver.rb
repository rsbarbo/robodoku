require "pry"
require "./lib/game_board"

class Solver

  attr_reader :gameboard

  def initialize(gameboard)
    @gameboard = gameboard
  end

  def peers
    all_the_possibilities = [*"1".."9"]
    find_missing = gameboard.creating_gameboard.select { |key| ameboard[key] == " "}
  end

  #delete blanks
  #if 8 missing_characters_in_row

  def pre_solver
    gameboard.creating_gameboard
  end

  def solve
    missing_character
  end


end
