require_relative 'spec_helper'

# http://adventofcode.com/2017/day/5

describe Day5 do
  describe "part1" do
    it "scenario 1" do
      input = "0\n3\n0\n1\n-3"
      expected = 5
      actual = Day5.part1(input)
      actual.must_equal(expected)
    end
  end
end
