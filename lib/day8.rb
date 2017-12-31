class Day8
  def self.part1(input)
    registers = Registers.new()
    input.strip.split(/\n/).each do |instruction|
      registers.execute_instruction(instruction)
    end
    registers.pretty_state.values.max
  end

  def self.part2(input)
    registers = Registers.new()
    input.strip.split(/\n/).each do |instruction|
      registers.execute_instruction(instruction)
    end
    registers.current_state.map{ |pair| pair[1].max_value }.max
  end

  class Registers
    attr_reader :current_state

    def initialize
      @current_state = Hash.new{ |hash, key| hash[key] = Register.new(0) }
    end

    def pretty_state
      pretty_state = Hash.new
      @current_state.each_pair do |key, register|
        if register.value != 0
          pretty_state[key] = register.value
        end
      end
      pretty_state
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
        @current_state[register].increment value
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

  class Register
    include Comparable
    attr_reader :value, :max_value
    def initialize(initial_value)
      @value = initial_value
      @max_value = initial_value
    end

    def increment(value)
      @value += value
      if @value > @max_value
        @max_value = @value
      end
    end

    def <=>(other)
      if other.is_a? Register
        self.value <=> other.value
      else
        self.value <=> other
      end
    end
  end
end
