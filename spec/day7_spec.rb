require_relative 'spec_helper'

# http://adventofcode.com/2017/day/7

describe Day7 do
  describe "part1" do
    it "scenario 1" do
      input = <<EOS
pbga (66)
xhth (57)
ebii (61)
havc (66)
ktlj (57)
fwft (72) -> ktlj, cntj, xhth
qoyq (66)
padx (45) -> pbga, havc, qoyq
tknk (41) -> ugml, padx, fwft
jptl (61)
ugml (68) -> gyxo, ebii, jptl
gyxo (61)
cntj (57)
EOS
      expected = "tknk"
      actual = Day7.part1(input)
      actual.must_equal(expected)
    end
  end
end
