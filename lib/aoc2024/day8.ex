defmodule Aoc.Aoc2024.Day8 do
  @antenna_type Enum.concat([?0..?9, ?A..?Z, ?a..?z])
                |> Enum.map(&<<&1>>)

  @doc """
  iex> 14 = Aoc.Aoc2024.Day8.part_1(\"""
  iex> ............
  iex> ........0...
  iex> .....0......
  iex> .......0....
  iex> ....0.......
  iex> ......A.....
  iex> ............
  iex> ............
  iex> ........A...
  iex> .........A..
  iex> ............
  iex> ............
  iex> \""")
  """
  def part_1(input) do
    field = parse(input)

    solve(field, 2, 1)
  end

  @doc """
  iex> 34 = Aoc.Aoc2024.Day8.part_2(\"""
  iex> ............
  iex> ........0...
  iex> .....0......
  iex> .......0....
  iex> ....0.......
  iex> ......A.....
  iex> ............
  iex> ............
  iex> ........A...
  iex> .........A..
  iex> ............
  iex> ............
  iex> \""")
  """
  def part_2(input) do
    field = parse(input)

    field_size = map_bounds(field)
    solve(field, 0, field_size)
  end

  def solve(field, max_distance, max_nodes_per_antenna) do
    field_size = map_bounds(field)

    antenna_groups =
      field
      |> Enum.filter(&check_point_for_antenna/1)
      |> Enum.group_by(&elem(&1, 1))
      |> Map.values()

    for antennas <- antenna_groups do
      find_antinodes(antennas, max_distance, max_nodes_per_antenna)
    end
    |> List.flatten()
    |> Enum.uniq()
    |> Enum.count(&(!is_nil(&1) and is_in_field(&1, field_size)))
  end

  def find_antinodes(antennas, min_distance, max_nodes) do
    for {antenna_a, _} <- antennas, {antenna_b, _} <- antennas do
      distance = Float.ceil(distance(antenna_a, antenna_b), 0)
      vec = direction_vec(antenna_a, antenna_b)

      if distance >= min_distance do
        for d <- 1..max_nodes do
          new_point(antenna_b, vec, d)
        end
      end
    end
  end

  def new_point({x1, y1}, {dx, dy}, d), do: {x1 + d * dx, y1 + d * dy}

  def direction_vec({x1, y1}, {x2, y2}), do: {x2 - x1, y2 - y1}

  def distance({x1, y1}, {x2, y2}) do
    dx = x2 - x1
    dy = y2 - y1

    :math.sqrt(dx * dx + dy * dy)
  end

  def is_in_field({x, y}, size), do: x >= 0 and x < size and y >= 0 and y < size

  def check_point_for_antenna({_, tile}), do: tile in @antenna_type

  def map_bounds(field) do
    map_size(field)
    |> :math.sqrt()
    |> trunc()
  end

  def parse(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.with_index()
    |> Enum.flat_map(fn {l, i} ->
      l |> String.graphemes() |> Enum.with_index() |> Enum.map(&{{i, elem(&1, 1)}, elem(&1, 0)})
    end)
    |> Map.new()
  end
end
