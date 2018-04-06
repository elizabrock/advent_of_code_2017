class Day11
  def self.part1(input)
    moves = input.split(",")
    hex = Hex.new()
    hex.move(*moves)
    old_moves = []
    moves = hex.moves
    until old_moves.count == moves.count
      old_moves = moves
      hex = Hex.new()
      hex.move(*moves)
      moves = hex.moves
    end
    hex.steps_away_from_center
  end

  class Hex
    attr_accessor :moves
    def initialize()
      @moves = []
    end

    def move(*moves)
      moves.each do |direction|
        if can_cancel_out?(direction)
          cancel_out!(direction)
        else
          @moves << direction
        end
      end
    end

    def steps_away_from_center
      @moves.count
    end

    private

    CANCELLATIONS = { "ne" => "sw",
                      "nw" => "se",
                      "se" => "nw",
                      "sw" => "ne",
                      "n"  => "s",
                      "s"  => "n" }
    SPECIAL_CANCELLATIONS = { "s" => "n",
                              "n" => "s" }
    STRIP_CANCELLATIONS = { "se" => ["sw", "w"],
                            "sw" => ["se", "e"],
                            "ne" => ["nw", "w"],
                            "nw" => ["ne", "e"] }

    def can_cancel_out?(direction)
      canceller = CANCELLATIONS[direction]
      return true if @moves.any?{ |move| move == canceller }
      cancelable_character = SPECIAL_CANCELLATIONS[direction]
      return true if (!cancelable_character.nil? and @moves.any?{ |move| move.include? cancelable_character })
      matchee, stripped_char = STRIP_CANCELLATIONS[direction]
      return true if !matchee.nil? and @moves.any?{ |move| move == matchee }
    end

    def cancel_out!(direction)
      canceller = CANCELLATIONS[direction]
      if index = @moves.index(canceller)
        @moves.delete_at(index)
      elsif cancelable_character = SPECIAL_CANCELLATIONS[direction]
        move = @moves.detect{ |move| move.include? cancelable_character }
        move.delete!(cancelable_character)
      elsif STRIP_CANCELLATIONS[direction]
        cancelable_character, stripped_char = STRIP_CANCELLATIONS[direction]
        move = @moves.detect{ |move| move.include? cancelable_character }
        move.delete!(stripped_char)
      else
        puts "I don't know how we got here"
      end
    end
  end
end
