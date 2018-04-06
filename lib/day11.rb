class Day11
  def self.part1(input)
    moves = input.split(",")
    hex = Hex.new()
    hex.move(*moves)
    hex.steps_away_from_center
  end

  class Hex
    attr_accessor :x, :y

    def initialize()
      @x = 0
      @y = 0
    end

    def move(*moves)
      moves.each{ |move| move_once(move) }
    end

    # NW|N |
    # --+--+--
    # SW|  |NE
    # --+--+--
    #   |S |SE

    def move_once(move)
      case move
      when "nw"
        @x -= 1
        @y += 1
      when "sw"
        @x -= 1
      when "s"
        @y -= 1
      when "se"
        @y -= 1
        @x += 1
      when "ne"
        @x += 1
      when "n"
        @y += 1
      end
    end

    def steps_away_from_center
      # https://www.redblobgames.com/grids/hexagons/#distances-cube
      (@x.abs + @y.abs + (@x + @y).abs) / 2
    end
  end
end
