require_relative 'spec_helper'

# http://adventofcode.com/2017/day/8

describe Day8 do
  let(:input) do
    <<~EOS
    b inc 5 if a > 1
    a inc 1 if b < 5
    c dec -10 if a >= 1
    c inc -20 if c == 10
    EOS
  end

  describe "part1" do
    it "scenario 1" do
      expected = 1
      actual = Day8.part1(input)
      actual.must_equal(expected)
    end
  end

  describe "part2" do
    it "scenario 1" do
      expected = 10
      actual = Day8.part2(input)
      actual.must_equal(expected)
    end
  end

  describe Day8::Registers do
    describe "execute_instruction" do
      it "inc with !gt" do
        expected = { }
        registers = Day8::Registers.new()
        registers.execute_instruction("b inc 5 if a > 1")
        actual = registers.pretty_state
        actual.must_equal expected
      end

      it "inc with gt" do
        expected = { "b" => 5 }
        registers = Day8::Registers.new()
        registers.execute_instruction("b inc 5 if a > -1")
        actual = registers.pretty_state
        actual.must_equal expected
      end

      it "inc with lt" do
        expected = { "a" => 1 }
        registers = Day8::Registers.new()
        registers.execute_instruction("a inc 1 if b < 5")
        actual = registers.pretty_state
        actual.must_equal expected
      end

      it "inc with lt" do
        expected = { "a" => 1 }
        registers = Day8::Registers.new()
        registers.execute_instruction("a inc 1 if b <= 0")
        actual = registers.pretty_state
        actual.must_equal expected
      end

      it "dec with gte" do
        expected = { "c" => 10 }
        registers = Day8::Registers.new()
        registers.execute_instruction("c dec -10 if a >= 0")
        actual = registers.pretty_state
        actual.must_equal expected
      end

      it "inc with eq" do
        expected = { "c" => -20 }
        registers = Day8::Registers.new()
        registers.execute_instruction("c inc -20 if c == 0")
        actual = registers.pretty_state
        actual.must_equal expected
      end

      it "inc with neq" do
        expected = { }
        registers = Day8::Registers.new()
        registers.execute_instruction("c inc -20 if c != 0")
        actual = registers.pretty_state
        actual.must_equal expected
      end
    end
  end
end
