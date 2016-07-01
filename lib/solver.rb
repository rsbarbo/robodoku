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

  def assign_possibilities
    [*"1".."9"]
  end

  def find_datastructure_with_multiple_chars
    find_missing_chars.keys.each do |blank|
      result_1 = board.select do |new_key|
        (new_key.chars & blank.chars).any? == true
    end
      possibilities = assign_possibilities
      result_1.each do |key|
        possibilities.delete(key.last)
      end
      update_board(blank,possibilities)
    end
    outcome_parser
  end


  def update_board(blank, possibilities)
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
        peers = board.select { |new_key| (new_key.chars & key_value.chars).any? == true}
        solved_peers = peers.select { |key| peers[key].length == 1}
        solved_peers.each { |solved| multiple_values[key_value].delete(solved[1]) }

        # p "#{key_value}: #{multiple_values[key_value]}"
        update_board(key_value,multiple_values[key_value])

      end
    end
    please_work
  end

  def please_work
    until board.values.join.length == 81
    multiple_values = find_keys_with_multiple_values
    multiple_values.keys.each do |spot|
        multiple_values[spot].each do |possibility|
          peers = board.select { |spots| (spots.chars & possibility.chars).any? == true}
          unsolved_peers = peers.select { |key| peers[key].length > 1}

          unsolved_peers.each do |different|
              unsolved_peers[different[0]].each do |possibility|
                if (unsolved_peers.values.join.include? possibility) == false
                  board[different[0]] = possibility
                  p "assigned #{possibility} to #{different[0]}"
                end
              end
          end
        end
    end
    end
    print_board
  end

  def print_board
    board.values.flatten.each_slice(9) {|line| puts line.join}
  end

  #moved to the button of the other
    def solve
      @board = GameBoard.new(gameboard).creating_gameboard
      find_datastructure_with_multiple_chars
    end
end
