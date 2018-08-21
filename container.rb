class Container
    attr_accessor :fields

    def initialize
      @fields = []
    end

    def update_possible_values
      already_in_container = fields.map(&:value).compact
      fields.each do |field|
        already_in_container.each { |value|
          field.remove_possibility(value)
        }
      end

      find_and_fill_only_possible_values
    end

    private

    def all_the_possible_values
      fields.map(&:possible_values).flatten
    end

    def find_and_fill_only_possible_values
      possible_values = fields.map(&:possible_values).flatten
      possible_values.select { |e| possible_values.count(e) == 1 }.each do |singular_value|
        field = fields.detect { |field| field.possible_values.include?(singular_value) && !fields.map(&:value).include?(singular_value) }
        field.set_value(singular_value) if field
      end
    end
end
