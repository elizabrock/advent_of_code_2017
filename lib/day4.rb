class Day4
  def self.part1(input)
    input.split(/\n/).count{ |line| valid_passphrase?(line) }
  end

  def self.valid_passphrase?(line)
    words = line.split(/\s/)
    unique_words = words.uniq
    words.length == unique_words.length
  end
end
