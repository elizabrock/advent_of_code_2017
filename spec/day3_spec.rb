require_relative 'spec_helper'

# http://adventofcode.com/2017/day/3

describe Day3 do
  describe "part1" do
    it "scenario 1" do
      input = "1"
      expected = 0
      actual = Day3.part1(input)
      actual.must_equal(expected)
    end
    it "scenario 12" do
      input = "12"
      expected = 3
      actual = Day3.part1(input)
      actual.must_equal(expected)
    end
    it "scenario 23" do
      input = "23"
      expected = 2
      actual = Day3.part1(input)
      actual.must_equal(expected)
    end
    it "scenario 1024" do
      input = "1024"
      expected = 31
      actual = Day3.part1(input)
      actual.must_equal(expected)
    end
  end
  describe "manhattan_distance" do
    it "scenario 1" do
      expected = 1
      actual = Day3.new(1, 0).manhattan_distance
      actual.must_equal(expected)
    end
    it "scenario 2" do
      expected = 3
      actual = Day3.new(2, -1).manhattan_distance
      actual.must_equal(expected)
    end
    it "scenario 3" do
      expected = 2
      actual = Day3.new(0, -2).manhattan_distance
      actual.must_equal(expected)
    end
  end
  describe "move" do
    it "scenario 1" do
      expected = [1, 0]
      day = Day3.new(0, 0)
      day.direction = Day3::E
      day.move!
      actual = day.coordinates
      actual.must_equal expected
    end
  end
  describe "turning_corner?" do
    it "scenario 2" do
      expected = true
      day = Day3.new(1, 0) # Start in position 2
      day.direction = Day3::E # Facing East
      actual = day.turning_corner?
      actual.must_equal expected
    end
  end
  describe "spiral_coordinates" do
    it "scenario 2, destination" do
      input = 2
      expected = [1, 0]
      day = Day3.new(0,0)
      day.spiral(input - 1)
      actual = day.coordinates
      actual.must_equal(expected)
    end
    it "scenario 2, direction" do
      input = 2
      expected = Day3::N
      day = Day3.new(0,0)
      day.spiral(input - 1)
      actual = day.direction
      actual.must_equal(expected)
    end
    it "scenario 3, coordinates" do
      input = 3
      expected = [1, 1]
      day = Day3.new(0,0)
      day.spiral(input - 1)
      actual = day.coordinates
    end
    it "scenario 3, direction" do
      input = 3
      expected = Day3::W
      day = Day3.new(0,0)
      day.spiral(input - 1)
      actual = day.direction
      actual.must_equal(expected)
    end
    it "scenario 4" do
      input = 4
      expected = [0, 1]
      day = Day3.new(0,0)
      day.spiral(input - 1)
      actual = day.coordinates
      actual.must_equal(expected)
    end
    it "scenario 5" do
      input = 5
      expected = [-1, 1]
      day = Day3.new(0,0)
      day.spiral(input - 1)
      actual = day.coordinates
      actual.must_equal(expected)
    end
    it "scenario n-1" do
      input = 12
      expected = [2, 1]
      day = Day3.new(0,0)
      day.spiral(input - 1)
      actual = day.coordinates
      actual.must_equal(expected)
    end
    it "scenario n" do
      input = 23
      expected = [0, -2]
      day = Day3.new(0,0)
      day.spiral(input - 1)
      actual = day.coordinates
      actual.must_equal(expected)
    end
  end
end
