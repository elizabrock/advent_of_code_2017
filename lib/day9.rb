class Day9
  def self.part1(input)
    group = CharacterGroup.parse(input)
    group.total_score
  end

  def self.part2(input)
    group = CharacterGroup.parse(input)
    group.garbage_character_count
  end

  class CharacterGroup
    attr_reader :groups, :parent

    def self.parse(input)
      # Remove ignored characters
      input.gsub!(/!./,"")
      first_char = input.slice!(0)
      raise "bad input" unless first_char == "{"
      group = Stream.new(input: input)
      group
    end

    def initialize(parent: nil, input: input)
      @parent = parent
      @groups = []
      unless input.nil?
        parse(input)
      end
    end

    def add_child(klass: CharacterGroup, input: nil)
      self.groups << klass.new(parent: self, input: input)
    end

    def garbage_character_count
      groups.inject(0){|sum, group| sum + group.garbage_character_count }
    end

    def size
      groups.inject(1){|sum, group| sum + group.size }
    end

    def score
      return @score if @score
      if parent.nil?
        @score = 1
      else
        @score = parent.score + 1
      end
    end

    def total_score
      self.groups.inject(self.score){|sum, group| sum + group.total_score }
    end

    private

    def parse(input)
      until input.empty? do
        # Scan until you see an "opening" character of "{" or "<"
        # Start a new group (Stream, or Garbage)
        # Delegate the remainder of the scan to the new group
        # Rinse repeat with what remains
        next_char = input.slice!(0)
        if ends_group?(next_char)
          return
        end
        next_class = group_started_by(next_char)
        unless next_class.nil?
          self.add_child(klass: next_class, input: input)
        end
      end
    end

    def ends_group?(char)
      false
    end

    def group_started_by(char)
      case char
      when "{"
        Stream
      when "<"
        Garbage
      else
        Text
      end
    end
  end

  class Stream < CharacterGroup

    private

    def ends_group?(char)
      char == "}"
    end
  end

  class Garbage < CharacterGroup
    def score
      0
    end

    def size
      0
    end

    private

    def ends_group?(char)
      char == ">"
    end

    def group_started_by(char)
      Text
    end
  end

  class Text < CharacterGroup
    def garbage_character_count
      self.parent.kind_of?(Garbage) ? 1 : 0
    end

    def score
      0
    end

    def size
      0
    end

    private

    def parse(input)
      return
    end
  end
end
