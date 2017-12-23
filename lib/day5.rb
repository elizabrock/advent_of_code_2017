class Day5
  def self.part1(input)
    items = input.split("\n").map(&:to_i)
    current_index = 0
    min_index = 0
    max_index = items.length - 1
    current_index = 0
    move_count = 0
    until current_index < min_index || current_index > max_index
      move = items[current_index]
      next_index = current_index + move
      items[current_index] += 1
      move_count += 1
      current_index = next_index
    end
    move_count
  end

  def self.part2(input)
    items = input.split("\n").map(&:to_i)
    current_index = 0
    min_index = 0
    max_index = items.length - 1
    current_index = 0
    move_count = 0
    until current_index < min_index || current_index > max_index
      move = items[current_index]
      next_index = current_index + move
      if move >= 3
        items[current_index] -= 1
      else
        items[current_index] += 1
      end
      move_count += 1
      current_index = next_index
    end
    move_count
  end
end
