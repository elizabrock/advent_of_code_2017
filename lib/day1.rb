class Day1
  def self.part1(input)
    input = input.split(//).map(&:to_i)
    pairs = input.zip(input.rotate)
    output = pairs.inject(0) do |sum, pair|
      if pair.first == pair.last
        sum + pair.first
      else
        sum
      end
    end
    output
  end
end
