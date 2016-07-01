require "pry"
require "./lib/game_board"

class Solver

  attr_reader :gameboard,
  :board, :possibilities

  def initialize(gameboard)
    @gameboard = gameboard
  end

  def find_missing_chars
    pre_solver.select do |key|
      pre_solver[key] == " "
    end
  end

  def find_datastructure_with_multiple_chars
    board.select do |hash_key|
      board[hash_key].length > 1
    end
  end

def create_possibilities
  [*"1".."9"]
end

  def checking_possibilities
    find_missing_chars.keys.each do |blank|
      result = board.select do |new_key|
        (new_key.chars & blank.chars).any? == true
    end
      possibilities = create_possibilities
      result.each do |key|
        possibilities.delete(key[1])
      end
      check_sing_or_mult_poss(blank,possibilities)
    end
  end

  def check_sing_or_mult_poss(blank, possibilities)
    if possibilities.length == 1
      board[blank] = possibilities.join
    else
      board[blank] = possibilities
    end
  end

  #makes the magic happen
  def outcome_parser

  end

  def pre_solver
    @board = gameboard.creating_gameboard
  end

  def solve
    checking_possibilities
  end


end
