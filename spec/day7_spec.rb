require_relative 'spec_helper'

# http://adventofcode.com/2017/day/7

describe Day7 do
  let(:input) do
    <<~EOS
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
  end

  describe "part1" do
    it "scenario 1" do
      expected = "tknk"
      actual = Day7.part1(input)
      actual.must_equal(expected)
    end
  end
  describe "part2" do
    it "scenario 1" do
      expected = 60
      actual = Day7.part2(input)
      actual.must_equal(expected)
    end
  end
  describe "unbalanced_branch" do
    it "scenario 1, branch off of root" do
      expected = "ugml"
      root = Day7::Tree.build_tree(input).root
      actual = root.unbalanced_branch.data
      actual.must_equal expected
    end
    it "scenario 2, interior branch" do
      expected = "ugml"
      root = Day7::Tree.build_tree(input + "\nabcd (68) -> tknk\n").root
      root.data.must_equal "abcd"
      actual = root.unbalanced_branch.data
      actual.must_equal expected
    end
  end
end
