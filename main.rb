require_relative 'container'
require_relative 'board'
require_relative 'field'
require_relative 'square'
require_relative 'row'
require_relative 'column'
require 'byebug'
require "uri"
require "net/http"
require 'nokogiri'

uri = URI.parse("https://show.websudoku.com/?level=4")
sudoku = Nokogiri::HTML(Net::HTTP.get_response(uri).body)
numbers = [[], [], [], [], [], [], [], [], []]

(0..8).each do |time|
  if sudoku.css('#puzzle_grid tr td input')[time].attributes['value']
    numbers[0] << sudoku.css('#puzzle_grid tr td input')[time].attributes['value'].value.to_i
  else
    numbers[0] << sudoku.css('#puzzle_grid tr td input')[time].attributes['value']
  end
end
(9..17).each do |time|
  if sudoku.css('#puzzle_grid tr td input')[time].attributes['value']
    numbers[1] << sudoku.css('#puzzle_grid tr td input')[time].attributes['value'].value.to_i
  else
    numbers[1] << sudoku.css('#puzzle_grid tr td input')[time].attributes['value']
  end
end
(18..26).each do |time|
  if sudoku.css('#puzzle_grid tr td input')[time].attributes['value']
    numbers[2] << sudoku.css('#puzzle_grid tr td input')[time].attributes['value'].value.to_i
  else
    numbers[2] << sudoku.css('#puzzle_grid tr td input')[time].attributes['value']
  end
end
(27..35).each do |time|
  if sudoku.css('#puzzle_grid tr td input')[time].attributes['value']
    numbers[3] << sudoku.css('#puzzle_grid tr td input')[time].attributes['value'].value.to_i
  else
    numbers[3] << sudoku.css('#puzzle_grid tr td input')[time].attributes['value']
  end
end
(36..44).each do |time|
  if sudoku.css('#puzzle_grid tr td input')[time].attributes['value']
    numbers[4] << sudoku.css('#puzzle_grid tr td input')[time].attributes['value'].value.to_i
  else
    numbers[4] << sudoku.css('#puzzle_grid tr td input')[time].attributes['value']
  end
end
(45..53).each do |time|
  if sudoku.css('#puzzle_grid tr td input')[time].attributes['value']
    numbers[5] << sudoku.css('#puzzle_grid tr td input')[time].attributes['value'].value.to_i
  else
    numbers[5] << sudoku.css('#puzzle_grid tr td input')[time].attributes['value']
  end
end
(54..62).each do |time|
  if sudoku.css('#puzzle_grid tr td input')[time].attributes['value']
    numbers[6] << sudoku.css('#puzzle_grid tr td input')[time].attributes['value'].value.to_i
  else
    numbers[6] << sudoku.css('#puzzle_grid tr td input')[time].attributes['value']
  end
end
(63..71).each do |time|
  if sudoku.css('#puzzle_grid tr td input')[time].attributes['value']
    numbers[7] << sudoku.css('#puzzle_grid tr td input')[time].attributes['value'].value.to_i
  else
    numbers[7] << sudoku.css('#puzzle_grid tr td input')[time].attributes['value']
  end
end
(72..80).each do |time|
  if sudoku.css('#puzzle_grid tr td input')[time].attributes['value']
    numbers[8] << sudoku.css('#puzzle_grid tr td input')[time].attributes['value'].value.to_i
  else
    numbers[8] << sudoku.css('#puzzle_grid tr td input')[time].attributes['value']
  end
end
#numbers = [
#    [2, nil, nil, nil, 9, 8, nil, nil, nil],
#    [nil, nil, 8, nil, 4, 6, nil, 7, nil],
#    [nil, 1, 5, nil,nil,nil,nil,nil,6],
#    [nil,nil,nil,4,6, nil,nil,2,nil],
#    [nil,nil,nil,7,nil,5,nil,nil,nil],
#    [nil, 4,nil,nil,2,9,nil,nil,nil],
#    [8,nil,nil,nil,nil,nil,2,4,nil],
#    [nil,9,nil,6,3,nil,7,nil,nil],
#    [nil,nil,nil,2,8,nil,nil,nil,3]
#]
board = Board.new(numbers)
board.initialize_grid
board.draw
c = 1
loop do
  board.update_possible_values
  break if board.solved?
  board.draw
  c = c+1
end
board.draw
puts "you win"
