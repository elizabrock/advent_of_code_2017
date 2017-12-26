class Day6
  def self.part1(input)
    banks = input.split(/\t/).map(&:to_i)
    day = Day6.new(banks)
    until day.has_looped?
      day.redistribute!
    end
    day.cycles
  end

  attr_reader :banks, :cycles

  def initialize(banks)
    @banks = banks
    @past_banks = []
    @cycles = 0
  end

  def redistribute!
    @past_banks << @banks.clone
    @cycles += 1
    # Find max index
    max = @banks.max
    index = @banks.find_index(max)
    # Zero it out
    redistribute = @banks[index]
    @banks[index] = 0
    # Redistribute its contents
    redistribute.times do
      index += 1
      # rotate, as needed
      index = index % @banks.length
      @banks[index] += 1
    end
  end

  def has_looped?
    @past_banks.include? @banks
  end
end
