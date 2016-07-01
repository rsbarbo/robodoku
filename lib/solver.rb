require "pry"
require "./lib/game_board"

class Solver

  attr_reader :gameboard

  def initialize(gameboard)
    binding.pry
    @gameboard = gameboard
  end

  def method_will_compare_with_something
    find_missing
  end

  def find_missing
    gameboard.creating_gameboard.select do |key|
      gameboard[key] == " "
    end
  end

    #delete blanks
    #if 8 missing_characters_in_row

  def solve
    method_will_compare_with_something
  end


end
