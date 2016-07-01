require "pry"
require "./lib/game_board"

class Solver

  attr_reader :gameboard

  def initialize(gameboard)
    @gameboard = gameboard
  end



  def find_missing
    gameboard.creating_gameboard.select do |key|
      gameboard[key] == " "
    end
  end

  #delete blanks
  #if 8 missing_characters_in_row

  def pre_solver
    gameboard.creating_gameboard
    binding.pry
  end

  def solve
    method_will_compare_with_something
  end


end
