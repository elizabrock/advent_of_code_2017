require_relative 'spec_helper'

# http://adventofcode.com/2017/day/9

describe Day9 do
  describe "part1" do
    it "scenario 1" do
      expected = 1
      actual = Day9.part1("{}")
      actual.must_equal(expected)
    end
    it "scenario 2" do
      expected = 6
      actual = Day9.part1("{{{}}}")
      actual.must_equal(expected)
    end
    it "scenario 3" do
      expected = 5
      actual = Day9.part1("{{},{}}")
      actual.must_equal(expected)
    end
    it "scenario 4" do
      expected = 16
      actual = Day9.part1("{{{},{},{{}}}}")
      actual.must_equal(expected)
    end
    it "scenario 5" do
      expected = 1
      actual = Day9.part1("{<a>,<a>,<a>,<a>}")
      actual.must_equal(expected)
    end
    it "scenario 6" do
      expected = 9
      actual = Day9.part1("{{<ab>},{<ab>},{<ab>},{<ab>}}")
      actual.must_equal(expected)
    end
    it "scenario 7" do
      expected = 9
      actual = Day9.part1("{{<!!>},{<!!>},{<!!>},{<!!>}}")
      actual.must_equal(expected)
    end
    it "scenario 8" do
      expected = 3
      actual = Day9.part1("{{<a!>},{<a!>},{<a!>},{<ab>}}")
      actual.must_equal(expected)
    end
  end
  describe "part2" do
    it "scenario 1" do
      expected = 0
      actual = Day9.part2("{}")
      actual.must_equal(expected)
    end
    it "scenario 2" do
      expected = 0
      actual = Day9.part2("{<>}")
      actual.must_equal(expected)
    end
    it "scenario 3" do
      expected = 17
      actual = Day9.part2("{<random characters>}")
      actual.must_equal(expected)
    end
    it "scenario 4" do
      expected = 3
      actual = Day9.part2("{<<<<>}")
      actual.must_equal(expected)
    end
    it "scenario 5" do
      expected = 4
      actual = Day9.part2("{<a>,<a>,<a>,<a>}")
      actual.must_equal(expected)
    end
    it "scenario 6" do
      expected = 2
      actual = Day9.part2("{<{!>}>}")
      actual.must_equal(expected)
    end
    it "scenario 7" do
      expected = 0
      actual = Day9.part2("{<!!>}")
      actual.must_equal(expected)
    end
    it "scenario 8" do
      expected = 10
      actual = Day9.part2("{<{o\"i!a,<{i<a>}")
      actual.must_equal(expected)
    end
  end
end

describe Day9::CharacterGroup do
  describe "parse" do
    it "scenario 1, one group" do
      expected = 1
      group = Day9::CharacterGroup.parse("{}")
      group.size.must_equal(expected)
    end
    it "scenario 2, two groups" do
      expected = 2
      group = Day9::CharacterGroup.parse("{{}}")
      group.size.must_equal(expected)
    end
    it "scenario 3, short garbage" do
      expected = 1
      group = Day9::CharacterGroup.parse("{<>}")
      group.size.must_equal(expected)
    end
    it "scenario 4, long garbage" do
      expected = 1
      group = Day9::CharacterGroup.parse("{<{},{},{{}}>}")
      group.size.must_equal(expected)
    end
    it "scenario 5" do
      expected = 3
      group = Day9::CharacterGroup.parse("{{{}}}")
      group.size.must_equal(expected)
    end
    it "scenario 6" do
      expected = 3
      group = Day9::CharacterGroup.parse("{{},{}}")
      group.size.must_equal(expected)
    end
    it "scenario 7" do
      expected = 6
      group = Day9::CharacterGroup.parse("{{{},{},{{}}}}")
      group.size.must_equal(expected)
    end
    it "scenario 8" do
      expected = 1
      group = Day9::CharacterGroup.parse("{<a>,<a>,<a>,<a>}")
      group.size.must_equal(expected)
    end
    it "scenario 9" do
      expected = 5
      group = Day9::CharacterGroup.parse("{{<a>},{<a>},{<a>},{<a>}}")
      group.size.must_equal(expected)
    end
    it "scenario 10" do
      expected = 2
      group = Day9::CharacterGroup.parse("{{<!>},{<!>},{<!>},{<a>}}")
      group.size.must_equal(expected)
    end
  end

  describe "score" do
    it "is one more than the parent object" do
      parent = MiniTest::Mock.new
      parent.expect :score, 12
      parent.expect :nil?, false
      character_group = Day9::CharacterGroup.new(parent: parent)
      character_group.score.must_equal 13
    end

    it "is 1 if there is no parent object" do
      character_group = Day9::CharacterGroup.new()
      character_group.score.must_equal 1
    end
  end

  describe "size" do
    it "is 1, if there are no children" do
      character_group = Day9::CharacterGroup.new()
      character_group.size.must_equal 1
    end

    it "is the number of descendants if there are children" do
      character_group = Day9::CharacterGroup.new()
      character_group.add_child
      character_group.add_child
      child = character_group.groups.last
      child.add_child
      child.add_child
      character_group.size.must_equal 5
    end

    it "ignores garbage" do
      character_group = Day9::CharacterGroup.new()
      character_group.add_child
      character_group.add_child(klass: Day9::Garbage)
      character_group.add_child
      child = character_group.groups.last
      child.add_child
      child.add_child
      character_group.size.must_equal 5
    end
  end

  describe "total_score" do
    it "is the same as score, if there are no children" do
      character_group = Day9::CharacterGroup.new()
      character_group.stub(:score, 2) do
        character_group.total_score.must_equal 2
      end
    end

    it "is the object's score plus the children's score if there are children" do
      character_group = Day9::CharacterGroup.new()
      character_group.add_child
      character_group.add_child(klass: Day9::Garbage)
      character_group.add_child
      child = character_group.groups.first
      child.add_child
      character_group.total_score.must_equal 8 # 1 + 2 + 2 + 3
    end
  end
end
