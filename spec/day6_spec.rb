require_relative 'spec_helper'

# http://adventofcode.com/2017/day/6

describe Day6 do
  describe "part1" do
    it "scenario 1" do
      input = "0\t2\t7\t0"
      expected = 5
      actual = Day6.part1(input)
      actual.must_equal(expected)
    end
  end
  describe "part2" do
    it "scenario 1" do
      input = "0\t2\t7\t0"
      expected = 4
      actual = Day6.part2(input)
      actual.must_equal(expected)
    end
  end
  describe "redistribute" do
    it "should redistribute according to the rules" do
      input = [0, 2, 7, 0]
      day = Day6.new(input)
      expected0 = [0, 2, 7, 0]
      day.banks.must_equal expected0
      day.redistribute!
      expected1 = [2, 4, 1, 2]
      day.banks.must_equal expected1
      day.redistribute!
      expected2 = [3, 1, 2, 3]
      day.banks.must_equal expected2
      day.redistribute!
      expected3 = [0, 2, 3, 4]
      day.banks.must_equal expected3
      day.redistribute!
      expected4 = [1, 3, 4, 1]
      day.banks.must_equal expected4
      day.redistribute!
      expected5 = [2, 4, 1, 2]
      day.banks.must_equal expected5
    end
  end
  describe "has_looped?" do
    it "should return true when loop is detected" do
      input = [0, 2, 7, 0]
      day = Day6.new(input)
      day.has_looped?.must_equal false
      day.redistribute!
      day.has_looped?.must_equal false
      day.redistribute!
      day.has_looped?.must_equal false
      day.redistribute!
      day.has_looped?.must_equal false
      day.redistribute!
      day.has_looped?.must_equal false
      day.redistribute!
      day.has_looped?.must_equal true
    end
  end
end

