
class Board
  def initialize(numbers)
    @numbers = numbers
    @grid = [[], [], [], [], [], [], [], [], []]
    initialize_grid
  end

  def initialize_grid
    numbers.each_with_index do |row, row_index|
      row.each_with_index do |value, value_index|
        grid[row_index][value_index] = Field.new(value: value, x: value_index, y: row_index)
      end
    end
    initialize_squares
    initialize_columns
    initialize_rows
  end

  def update_possible_values
    squares.each { |square| square.update_possible_values }
    columns.each { |column| column.update_possible_values }
    rows.each    { |row| row.update_possible_values }
  end

  def solved?
    grid.flatten.flatten.all? { |field| field.value }
  end

  def draw
    grid.each do |row|
      puts "\n"
      row.each do |field|
        field.draw
      end
    end
    puts
  end

  private

  attr_reader :numbers, :grid, :columns, :squares, :rows

  def initialize_squares
    @squares = [
      Square.new, Square.new, Square.new, Square.new, Square.new, Square.new, Square.new, Square.new, Square.new
    ]
    each_field { |row_index, value_index, field| determine_square(value_index, row_index).fields << field }
  end

  def initialize_columns
    @columns = [
      Column.new, Column.new, Column.new, Column.new, Column.new, Column.new, Column.new, Column.new, Column.new
    ]
    each_field { |row_index, value_index, field| determine_column(row_index).fields << field }
  end

  def initialize_rows
    @rows = [
      Row.new, Row.new, Row.new, Row.new, Row.new, Row.new, Row.new, Row.new, Row.new
    ]
    each_field { |row_index, value_index, field| determine_row(value_index).fields << field }
  end

  def determine_column(row_index)
    columns[row_index]
  end

  def determine_row(value_index)
    rows[value_index]
  end

  def each_field(&block)
    grid.each_with_index do |row, row_index|
      row.each_with_index do |field, value_index|
        block.call(row_index, value_index, field)
      end
    end
  end

  def determine_square(value_index, row_index)
    case value_index
    when 0..2
      case row_index
      when 0..2
        @squares[0]
      when 3..5
        @squares[3]
      when 6..8
        @squares[6]
      end
    when 3..5
      case row_index
      when 0..2
        @squares[1]
      when 3..5
        @squares[4]
      when 6..8
        @squares[7]
      end
    when 6..8
      case row_index
      when 0..2
        @squares[2]
      when 3..5
        @squares[5]
      when 6..8
        @squares[8]
      end
    end
  end
end
