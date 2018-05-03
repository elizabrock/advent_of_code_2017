class Day13
  def self.part1(input)
    input_hash = {}
    input.split("\n").map do |line|
      key, value = line.split(": ").map(&:to_i)
      input_hash[key] = value
    end
    firewall = Firewall.new(input_hash)
    firewall.traverse_firewall!
    firewall.trip_cost
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

    def traverse_firewall!
      @layout.length.times do
        tick!
      end
    end

    def tick!
      move_self!
      scan!
      move_scanners!
    end

    private

    def move_self!
      @my_location += 1
    end

    def scan!
      depth = @my_location
      if @scanner_locations[depth] == 0
        range = @layout[depth]
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
