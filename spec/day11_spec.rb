require_relative 'spec_helper'

# http://adventofcode.com/2017/day/11

describe Day11 do
  describe "part1" do
    it "parses the input properly" do
      Day11.part1("ne,ne,ne").must_equal 3
    end
  end
  describe "steps_away_from_center" do
    it "scenario 1" do
      hex = Day11::Hex.new
      hex.move("ne", "ne", "ne")
      hex.moves.must_equal(["ne", "ne", "ne"])
      hex.steps_away_from_center.must_equal 3
    end
    it "scenario 2" do
      hex = Day11::Hex.new
      hex.move("ne", "ne", "sw", "sw")
      #hex.moves.must_equal([])
      hex.steps_away_from_center.must_equal 0
    end
    it "scenario 3" do
      hex = Day11::Hex.new
      hex.move("ne", "ne", "s", "s")
      #hex.moves.must_equal(["se", "se"])
      hex.steps_away_from_center.must_equal 2
    end
    it "scenario 4" do
      hex = Day11::Hex.new
      hex.move("se", "sw", "se", "sw", "sw")
      hex.moves.must_equal(["s", "s", "sw"])
      hex.steps_away_from_center.must_equal 3
    end
    it "scenario 5" do
      hex = Day11::Hex.new
      hex.move("ne", "ne", "s")
      hex.steps_away_from_center.must_equal 2
    end
    it "scenario 6" do
      hex = Day11::Hex.new
      hex.move("s", "ne")
      hex.steps_away_from_center.must_equal 1
    end
  end
end
