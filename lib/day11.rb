class Day11
  def self.part1(input)
    moves = input.split(",")
    hex = Hex.new()
    moves.each do |move|
      hex.move(move)
    end
    hex.steps_away_from_center
  end

  def self.part2(input)
    moves = input.split(",")
    hex = Hex.new()
    max_distance = 0
    moves.each do |move|
      hex.move(move)
      if hex.steps_away_from_center > max_distance
        max_distance = hex.steps_away_from_center
      end
    end
    max_distance
  end

  class Hex
    attr_accessor :x, :y

    def initialize()
      @x = 0
      @y = 0
    end

    def move_many(*moves)
      moves.each{ |move| move(move) }
    end

    # NW|N |
    # --+--+--
    # SW|  |NE
    # --+--+--
    #   |S |SE

    def move(move)
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
