require_relative 'spec_helper'

# http://adventofcode.com/2017/day/1

describe Day2 do
  describe "part1" do
    it "scenario 1" do
      input = "5\t1\t9\t5\n7\t5\t3\n2\t4\t6\t8"
      expected = 18
      actual = Day2.part1(input)
      actual.must_equal(expected)
    end
  end
  describe "row_checksum" do
    it "scenario 1" do
      input = [5, 1, 9, 5]
      expected = 8
      actual = Day2.row_checksum(input)
      actual.must_equal(expected)
    end
    it "scenario 2" do
      input = [7, 5, 3]
      expected = 4
      actual = Day2.row_checksum(input)
      actual.must_equal(expected)
    end
    it "scenario 3" do
      input = [2, 4, 6, 8]
      expected = 6
      actual = Day2.row_checksum(input)
      actual.must_equal(expected)
    end
  end
end

