require_relative 'spec_helper'

# http://adventofcode.com/2017/day/10

describe Day10 do
  describe Day10::CircularArray do
    describe "slice" do
      it "works with a regular index" do
        array = Day10::CircularArray.new(["a", "b", "c", "d"])
        expected = ["b", "c"]
        actual = array.slice(1, 2)
        actual.must_equal expected
      end
      it "works with a looping index" do
        array = Day10::CircularArray.new(["a", "b", "c", "d"])
        expected = ["b", "c"]
        actual = array.slice(5, 2)
        actual.must_equal expected
      end
    end
  end
  describe Day10::Knot do
    describe "initialize" do
      it "creates a string of the correct length" do
        knot = Day10::Knot.new(256)
        knot.string.size.must_equal 256
        knot.string.last.must_equal 255
      end
    end
    describe "twist" do
      it "follows the rules outlined in Day 10" do
        knot = Day10::Knot.new(5)
        expected = [0, 1, 2, 3, 4]
        knot.string.to_a.must_equal expected
        knot.current_position.must_equal 0
        knot.skip_size.must_equal 0
        knot.checksum.must_equal 0

        knot.twist(3)
        expected = [2, 1, 0, 3, 4]
        knot.string.to_a.must_equal expected
        knot.current_position.must_equal 3
        knot.skip_size.must_equal 1
        knot.checksum.must_equal 2

        knot.twist(4)
        expected = [4, 3, 0, 1, 2]
        knot.string.to_a.must_equal expected # We are here
        knot.current_position.must_equal 8
        knot.skip_size.must_equal 2
        knot.checksum.must_equal 12

        knot.twist(1)
        expected = [4, 3, 0, 1, 2]
        knot.string.to_a.must_equal expected
        knot.current_position.must_equal 11
        knot.skip_size.must_equal 3
        knot.checksum.must_equal 12

        knot.twist(5)
        expected = [3, 4, 2, 1, 0]
        knot.string.to_a.must_equal expected
        knot.current_position.must_equal 19
        knot.skip_size.must_equal 4
        knot.checksum.must_equal 12
      end
    end
  end
end
