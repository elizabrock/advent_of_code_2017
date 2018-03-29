class Day10
  def self.part1(input)
    knot = Knot.new(256)
    input.split(",").each do |length|
      knot.twist(length.to_i)
    end
    knot.checksum
  end

  class CircularArray
    def initialize(initial_array)
      @array = initial_array
    end

    def []=(index, value)
      index = true_index(index)
      @array[index] = value
    end

    def slice(start, length)
      start = true_index(start)
      slice = @array.slice(start, length)
      difference = length - slice.length
      slice + @array.slice(0, difference)
    end

    def method_missing(m, *args, &block)
      @array.send(m, *args, &block)
    end

    private

    def true_index(index)
      index % @array.size
    end
  end

  class Knot
    attr_reader :string, :current_position, :skip_size

    def initialize(length)
      # To achieve this, begin with a list of numbers from 0 to 255,
      @string = CircularArray.new((0...length).to_a)
      # a current position which begins at 0 (the first element in the list),
      @current_position = 0
      # a skip size (which starts at 0),
      @skip_size = 0
      # and a sequence of lengths (your puzzle input).
    end

    def checksum
      # the result of multiplying the first two numbers in the list
      @string[0] * @string[1]
    end

    def twist(length)
      # Then, for each length:
      # Reverse the order of that length of elements in the list, starting with the element at the current position.
      reverse(from: @current_position, num: length)
      # Move the current position forward by that length plus the skip size.
      move(length + @skip_size)
      # Increase the skip size by one.
      @skip_size += 1
    end

    private

    def move(positions)
      @current_position += positions
    end

    def reverse(from:, num:)
      pinch = @string.slice(from, num)
      pinch.reverse.each_with_index do |item, index|
        @string[from + index] = item
      end
    end
  end
end
