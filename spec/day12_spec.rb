require_relative 'spec_helper'

# http://adventofcode.com/2017/day/12

describe Day12 do
  let(:input){
    <<~STRING
      0 <-> 2
      1 <-> 1
      2 <-> 0, 3, 4
      3 <-> 2, 4
      4 <-> 2, 3, 6
      5 <-> 6
      6 <-> 4, 5
    STRING
  }
  let(:village){ Day12::Village.new(input) }

  describe "part1" do
    it "parses the input properly" do
      Day12.part1(input).must_equal 6
    end
  end

  describe Day12::Village do
    describe "initialize" do
      it "creates the appropriate number of villagers" do
        village.villagers.count.must_equal 7
      end
    end
    describe "find" do
      it "finds the villager" do

      end
    end
  end

  describe Day12::Villager do
    describe "was_called_by?" do
      before do
        village.find(0).initiate_phone_tree!
      end
      it "is true that a villager can communicate with themselves" do
        village.find(1).initiate_phone_tree!
        village.find(1).was_called_by?(1).must_equal true
      end
      it "is true that a villager can communicate with just themselves" do
        village.find(1).was_called_by?(0).must_equal false
      end
      it "is true that you can communicate with the directly connected" do
        village.find(2).was_called_by?(0).must_equal true
      end
      it "is true that you can communicate with the indirectly connected" do
        village.find(3).was_called_by?(0).must_equal true
      end
      it "is true that you can communicate with the very indirectly connected" do
        village.find(6).was_called_by?(0).must_equal true
      end
      it "is true that you can communicate with the quite indirectly connected" do
        village.find(5).was_called_by?(0).must_equal true
      end
    end
  end
end
