class Day3
  N = [0, 1]
  W = [-1, 0]
  S = [0, -1]
  E = [1, 0]

  def self.part1(input)
    manhattan_distance(spiral_coordinates(input.to_i))
  end

  def self.manhattan_distance(coordinates)
    coordinates[0].abs + coordinates[1].abs
  end

  def self.spiral_coordinates(n)
    current_coordinates = [0, 0]
    ne_corner = [0, 0]
    nw_corner = [0, 0]
    sw_corner = [0, 0]
    se_corner = [0, 1]
    direction = E
    # for each step, continue heading in <direction>
    # until we are farther in <direction> than the nearest corner
    # then, turn
    (n-1).times do
      current_coordinates = move(direction, current_coordinates)
      if turning_corner?(current_coordinates, direction, ne_corner, nw_corner, sw_corner, se_corner)
        update_corner(current_coordinates, direction, ne_corner, nw_corner, sw_corner, se_corner)
        direction = next_direction(direction)
      end
    end
    current_coordinates
  end

  def self.move(direction, coordinates)
    [direction[0] + coordinates[0], direction[1] + coordinates[1]]
  end

  def self.turning_corner?(coordinates, direction, ne_corner, nw_corner, sw_corner, se_corner)
    case direction
    when N
      next_corner = nw_corner
      directions = [N, W]
    when W
      next_corner = sw_corner
      directions = [S, W]
    when S
      next_corner = se_corner
      directions = [S, E]
    when E
      next_corner = ne_corner
      directions = [N, E]
    end
    # calculate coordinates diagonal of corner
    corner_coordinates = move(move(next_corner, directions[0]), directions[1])
    coordinates == corner_coordinates
  end

  def self.update_corner(coordinates, direction, ne_corner, nw_corner, sw_corner, se_corner)
    corner = case direction
    when N
      nw_corner
    when W
      sw_corner
    when S
      se_corner
    when E
      ne_corner
    end
    corner[0] = coordinates[0]
    corner[1] = coordinates[1]
  end

  def self.next_direction(direction)
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
