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
      coordinates = [1, 0]
      expected = 1
      actual = Day3.manhattan_distance(coordinates)
      actual.must_equal(expected)
    end
    it "scenario 2" do
      coordinates = [2, -1]
      expected = 3
      actual = Day3.manhattan_distance(coordinates)
      actual.must_equal(expected)
    end
    it "scenario 3" do
      coordinates = [0, -2]
      expected = 2
      actual = Day3.manhattan_distance(coordinates)
      actual.must_equal(expected)
    end
  end
  describe "move" do
    it "scenario 1" do
      expected = [1, 0]
      actual = Day3.move([0, 0], Day3::E)
      actual.must_equal expected
    end
  end
  describe "turning_corner?" do
    it "scenario 2" do
      expected = true
      corner = [0, 0]
      actual = Day3.turning_corner?([1,0], Day3::E, corner, corner, corner, corner)
      actual.must_equal expected
    end
  end
  describe "spiral_coordinates" do
    it "scenario 1" do
      input = 1
      expected = [0, 0]
      actual = Day3.spiral_coordinates(input)
      actual.must_equal(expected)
    end
    it "scenario 2" do
      input = 2
      expected = [1, 0]
      actual = Day3.spiral_coordinates(input)
      actual.must_equal(expected)
    end
    it "scenario 3" do
      input = 3
      expected = [1, 1]
      actual = Day3.spiral_coordinates(input)
      actual.must_equal(expected)
    end
    it "scenario 4" do
      input = 4
      expected = [0, 1]
      actual = Day3.spiral_coordinates(input)
      actual.must_equal(expected)
    end
    it "scenario 5" do
      input = 5
      expected = [-1, 1]
      actual = Day3.spiral_coordinates(input)
      actual.must_equal(expected)
    end
    it "scenario n-1" do
      input = 12
      expected = [2, -1]
      actual = Day3.spiral_coordinates(input)
      actual.must_equal(expected)
    end
    it "scenario n" do
      input = 23
      expected = [0, -2]
      actual = Day3.spiral_coordinates(input)
      actual.must_equal(expected)
    end
  end
end
