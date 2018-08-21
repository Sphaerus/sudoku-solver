class Field
  attr_accessor :value, :possible_values, :x, :y

  def initialize(value: value, x: x, y: y)
    @value = value
    @x = x
    @y = y
    initialize_possible_values
  end

  def remove_possibility(value)
    @possible_values.delete value
    determine_value
  end

  def draw
    to_draw = value || ' '
    print "#{to_draw}|"
  end

  def set_value(new_value)
    @possible_values = []
    @value = new_value
  end

  private

  def determine_value
    set_value @possible_values.first if @possible_values.count == 1
  end

  def initialize_possible_values
    if value
      @possible_values = []
    else
      @possible_values = (1..9).to_a
    end
  end
end
