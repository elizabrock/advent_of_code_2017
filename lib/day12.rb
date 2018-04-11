class Day12
  def self.part1(input)
    village = Village.new(input)
    village.in_communication_with(0).count
  end

  class Village
    attr_reader :villagers
    def initialize(input)
      @villagers = input.split("\n").map do |line|
        name, neighbors = line.scan(/(\d+) <-> (.*)/).first
        name = name.to_i
        neighbors = neighbors.split(", ").map(&:to_i)
        Villager.new(name, neighbors, self)
      end
    end

    def find(name)
      @villagers[name]
    end

    def in_communication_with(recipient)
      villager = @villagers[recipient]
      villager.initiate_phone_tree!
      @villagers.find_all{ |villager| villager.was_called_by?(recipient) }
    end
  end

  class Villager
    attr_reader :name

    def initialize(name, neighbors_names, village)
      @phoned_by = []
      @village = village
      @name = name
      @neighbors_names = neighbors_names
      @can_communicate_with = {}
    end

    def was_called_by?(name)
      @phoned_by.include? name
    end

    def initiate_phone_tree!(from: nil)
      if from.nil?
        from = self
      end
      return if @phoned_by.include? from.name
      @phoned_by << from.name
      @neighbors_names.each do |neighbor_name|
        neighbor = @village.find(neighbor_name)
        neighbor.initiate_phone_tree!(from: from)
      end
    end
  end
end
