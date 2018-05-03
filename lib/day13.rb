class Day13
  def self.part1(input)
    firewall = Firewall.new(parse_input(input))
    firewall.traverse_firewall!
    firewall.trip_cost
  end

  def self.part2(input)
    Firewall.ideal_delay_for(parse_input(input))
  end

  def self.parse_input(input)
    input_hash = {}
    input.split("\n").map do |line|
      key, value = line.split(": ").map(&:to_i)
      input_hash[key] = value
    end
    input_hash
  end

  class Firewall
    attr_accessor :layout, :scanner_locations, :my_location, :trip_cost
    def initialize(scanner_configuration)
      gauntlet_length = scanner_configuration.keys.max + 1
      @scanner_locations = Array.new(gauntlet_length)
      @scanner_directions = Array.new(gauntlet_length){ 1 }
      @layout = Array.new(gauntlet_length){ 0 }
      scanner_configuration.each_pair do |location, depth|
        @layout[location] = depth
        @scanner_locations[location] = 0
      end
      @my_location = -1
      @trip_cost = 0
    end

    def self.ideal_delay_for(input)
      delay = -1
      cost = 1
      loop do
        delay += 1
        firewall = Firewall.new(input)
        delay.times{ firewall.delay! }
        firewall.traverse_firewall!
        break unless firewall.got_caught?
      end
      delay
    end

    def got_caught?
      @got_caught
    end

    def delay!
      move_scanners!
    end

    def tick!
      move_self!
      scan!
      move_scanners!
    end

    def traverse_firewall!
      @layout.length.times do
        tick!
      end
    end

    private

    def move_self!
      @my_location += 1
    end

    def scan!
      depth = @my_location
      if @scanner_locations[depth] == 0
        range = @layout[depth]
        @got_caught = true
        @trip_cost += depth * range
      end
    end

    def move_scanners!
      @scanner_locations.each_with_index do |current_location, index|
        unless current_location.nil?
          max_location = @layout[index] - 1
          direction = @scanner_directions[index]
          new_location = current_location + direction
          if new_location == 0 or new_location == max_location
            # reverse direction!
            @scanner_directions[index] = direction * -1
          end
          @scanner_locations[index] = new_location
        end
      end
    end
  end
end
