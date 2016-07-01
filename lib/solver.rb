require "pry"
require "./lib/game_board"

class Solver

  attr_reader :gameboard,
  :possibilities,
  :board

  def initialize(gameboard)
    @gameboard = gameboard
  end

  def find_missing_chars
    board.select do |key|
      board[key] == " "
    end
  end

  def creating_possibilities
    [*"1".."9"]
  end

  def find_datastructure_with_multiple_chars
    find_missing_chars.keys.each do |blank|
      result_1 = board.select do |new_key|
        (new_key.chars & blank.chars).any? == true
      end
      possibilities = creating_possibilities
      result_1.each do |key|
        possibilities.delete(key.last)
      end
      check_sing_or_mult_poss(blank,possibilities)
    end
    outcome_parser
  end

  def check_sing_or_mult_poss(blank, possibilities)
    if possibilities.length == 1
      board[blank] = possibilities.join
    else
      board[blank] = possibilities
    end
  end

  def find_keys_with_multiple_values
    board.select do |key|
      board[key].length > 1
    end
  end

  def outcome_parser
    3.times do
      multiple_values = find_keys_with_multiple_values
      multiple_values.keys.each do |key_value|
        result = board.select do |new_key|
          (new_key.chars & key_value.chars).any? == true
        end
        solved_puzzle = result.select do |key|
          result[key].length == 1
        end
        solved_puzzle.each do |solved|
          multiple_values[key_value].delete(solved[1])
        end
        check_sing_or_mult_poss(key_value,multiple_values[key_value])
      end
    end
    final_board_check
  end

  def final_board_check
    until board.values.join.length == 81
      multiple_values = find_keys_with_multiple_values
      multiple_values.keys.each do |position_1|
        multiple_values[position_1].each do |possibility_counter|
          result = board.select do |position_2|
            (position_2.chars & possibility_counter.chars).any? == true
          end
          unresolved_puzzle = result.select do |key|
            result[key].length > 1
          end
          unresolved_puzzle.each do |different|
            unresolved_puzzle[different.first].each do |possibility_counter|
              #need to add a checker here to stop if possibilities are infinit
              #it needs to stop
              if (unresolved_puzzle.values.join.include? possibility_counter) == false
                binding.pry
                board[different.first] = possibility_counter
                p "assigned #{possibility_counter} to #{different[0]}"
              end
            end
          end
        end
      end
    end
    print_out_to_terminal
  end

  def print_out_to_terminal
    board.values.flatten.each_slice(9) do |line|
      puts line.join
    end
  end

  def solver_parser
    @board = GameBoard.new(gameboard).creating_gameboard
    find_datastructure_with_multiple_chars
  end

  def solve
    solver_parser
  end
end
