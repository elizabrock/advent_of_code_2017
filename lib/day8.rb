class Day8
  def self.part1(input)
    registers = Registers.new()
    input.strip.split(/\n/).each do |instruction|
      registers.execute_instruction(instruction)
    end
    registers.current_state.values.max
  end

  class Registers
    attr_reader :current_state

    def initialize
      @current_state = Hash.new(0)
    end

    def execute_instruction(instruction)
      # Example instruction:
      # b inc 5 if a > 1
      # register action value if conditional
      matches = instruction.match(/(\w+) (\w+) ([-\d]+) if (.*)/).to_a
      full_match, register, action, value, conditional = matches
      value = value.to_i
      if action == "dec"
        value = value * -1
      end
      if evaluate_conditional(conditional)
        @current_state[register] += value
      end
    end

    def evaluate_conditional(conditional_statement)
      matches = conditional_statement.match(/(\w+) ([><!=]+) ([-\d]+)/).to_a
      full_match, register, operator, value = matches
      register_value = @current_state[register]
      comparison_value = value.to_i
      register_value.send(operator, comparison_value)
    end
  end
end
