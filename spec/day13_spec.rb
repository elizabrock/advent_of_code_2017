require_relative 'spec_helper'

# http://adventofcode.com/2017/day/13

describe Day13 do
  let(:input2){
    <<~STRING
      0: 3
      1: 2
      4: 4
      6: 4
    STRING
  }

  describe "#part1" do
    it "parses the input properly" do
      Day13.part1(input2).must_equal 24
    end
  end

  describe "Firewall" do
    let(:input){
      { 0 => 3, 1 => 2, 4 => 4, 6 => 4 }
    }
    let(:firewall){ Day13::Firewall.new(input) }

    it "layout" do
      firewall.layout.must_equal [3, 2, 0, 0, 4, 0, 4]
    end

    it "scanner_locations" do
      firewall.scanner_locations.must_equal [0, 0, nil, nil, 0, nil, 0]
      firewall.tick!
      firewall.scanner_locations.must_equal [1, 1, nil, nil, 1, nil, 1]
      firewall.tick!
      firewall.scanner_locations.must_equal [2, 0, nil, nil, 2, nil, 2]
      firewall.tick!
      firewall.scanner_locations.must_equal [1, 1, nil, nil, 3, nil, 3]
    end

    it "my_location" do
      firewall.my_location.must_equal -1
      firewall.tick!
      firewall.my_location.must_equal 0
      firewall.tick!
      firewall.my_location.must_equal 1
      firewall.tick!
      firewall.my_location.must_equal 2
      firewall.tick!
      firewall.my_location.must_equal 3
    end

    it "trip_cost" do
      firewall.traverse_firewall!
      firewall.trip_cost.must_equal 24
    end
  end
end
