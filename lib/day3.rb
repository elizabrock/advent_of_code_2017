class Day3
  N = [0, 1]
  W = [-1, 0]
  S = [0, -1]
  E = [1, 0]

  attr_reader :coordinates
  attr_accessor :direction

  def self.part1(input)
    day3 = Day3.new(0,0)
    # Since we start at 1, only move n - 1 times
    moves = input.to_i - 1
    day3.spiral(moves)
    day3.manhattan_distance
  end

  def self.part2(input)
    goal = input.to_i
    day3 = Day3.new(0,0)
    while day3.current_value <= goal
      day3.move!
    end
    day3.current_value
  end

  def initialize(x = 0, y = 0)
    @cells = Hash.new{ |hash, key| hash[key] = Hash.new(0) }
    @cells[0][0] = 1
    @coordinates = [x, y]
    @ne_corner = [0, 0]
    @nw_corner = [0, 0]
    @sw_corner = [0, 0]
    @se_corner = [0, 1]
    @direction = E
  end

  def current_value
    @cells[@coordinates[0]][@coordinates[1]]
  end

  def manhattan_distance
    coordinates[0].abs + coordinates[1].abs
  end

  def spiral(n)
    # for each step, continue heading in <direction>
    # until we are farther in <direction> than the nearest corner
    # then, turn
    n.times do
      move!
    end
  end

  def move!
    x = coordinates[0] + direction[0]
    y = coordinates[1] + direction[1]
    @coordinates = [x, y]
    @cells[x][y] = adjacent_values.inject{ |sum, val| sum + val }
    turn! if turning_corner?
  end

  def turning_corner?
    next_corner_at = [nil, nil]
    case direction
    when N
      next_corner_at[0] = @ne_corner[0] + N[0] + E[0]
      next_corner_at[1] = @ne_corner[1] + N[1] + E[1]
    when W
      next_corner_at[0] = @nw_corner[0] + N[0] + W[0]
      next_corner_at[1] = @nw_corner[1] + N[1] + W[1]
    when S
      next_corner_at[0] = @sw_corner[0] + S[0] + W[0]
      next_corner_at[1] = @sw_corner[1] + S[1] + W[1]
    when E
      next_corner_at[0] = @se_corner[0] + S[0] + E[0]
      next_corner_at[1] = @se_corner[1] + S[1] + E[1]
    end
    @coordinates == next_corner_at
  end

  def turn!
    case @direction
    when N
      @ne_corner = coordinates.clone
    when W
      @nw_corner = coordinates.clone
    when S
      @sw_corner = coordinates.clone
    when E
      @se_corner = coordinates.clone
    end
    @direction = next_direction(direction)
  end

  def adjacent_values
    x = @coordinates[0]
    y = @coordinates[1]
    x_vals = (x - 1)..(x + 1)
    y_vals = (y - 1)..(y + 1)
    cells = x_vals.to_a.product(y_vals.to_a)
    cells.map{ |pair| @cells[pair[0]][pair[1]] }
  end

  def next_direction(direction)
    case direction
    when N
      W
    when W
      S
    when S
      E
    when E
      N
    end
  end
end
