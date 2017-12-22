class Day2
  def self.part1(input)
    rows = input.split("\n").map{ |row| row.split("\t").map(&:to_i) }
    rows.inject(0){ |checksum, row| checksum + self.row_checksum(row) }
  end

  def self.row_checksum(row)
    row.max - row.min
  end

  def self.part2(input)
    rows = input.split("\n").map{ |row| row.split("\t").map(&:to_i) }
    rows.inject(0){ |checksum, row| checksum + self.row_division(row) }
  end

  def self.row_division(row)
    row.permutation(2) do |pair|
      min, max = pair.sort
      if max % min == 0
        return max / min
      end
    end
  end
end
