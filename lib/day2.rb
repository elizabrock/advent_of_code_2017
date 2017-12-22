class Day2
  def self.part1(input)
    rows = input.split("\n").map{ |row| row.split("\t").map(&:to_i) }
    rows.inject(0){ |checksum, row| checksum + self.row_checksum(row) }
  end

  def self.row_checksum(row)
    row.max - row.min
  end
end
