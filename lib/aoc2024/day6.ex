defmodule Aoc.Aoc2024.Day6 do
  defmodule Room do
    defstruct bounds: {0, 0}, obstical: nil, coordinates: []
  end

  @doc """
  iex> 41 = Aoc.Aoc2024.Day6.part_1(\"""
  iex> ....#.....
  iex> .........#
  iex> ..........
  iex> ..#.......
  iex> .......#..
  iex> ..........
  iex> .#..^.....
  iex> ........#.
  iex> #.........
  iex> ......#...
  iex> \""")
  """
  def part_1(input) do
    room =
      parse(input)
      |> to_room()

    {coordinates, direction} =
      Enum.find(room.coordinates, &find_stating_coordinates/1)

    direction = get_direction(direction)

    walk(room, direction, coordinates, MapSet.new())
    |> Enum.uniq_by(&elem(&1, 0))
    |> Enum.count()
  end

  @doc """
  iex> 6 = Aoc.Aoc2024.Day6.part_2(\"""
  iex> ....#.....
  iex> .........#
  iex> ..........
  iex> ..#.......
  iex> .......#..
  iex> ..........
  iex> .#..^.....
  iex> ........#.
  iex> #.........
  iex> ......#...
  iex> \""")
  """
  def part_2(input) do
    room =
      parse(input)
      |> to_room()

    {start_coordinates, direction} =
      Enum.find(room.coordinates, &find_stating_coordinates/1)

    direction =
      get_direction(direction)

    solution_part1 =
      walk(room, direction, start_coordinates, MapSet.new())
      |> Enum.map(&elem(&1, 0))
      |> Enum.uniq()

    # Task.async_stream(
    Enum.reduce(solution_part1, 0, fn pos, acc ->
      if pos != start_coordinates do
        res =
          Map.put(room, :obstical, pos)
          |> walk(direction, start_coordinates, MapSet.new())

        if :loop == res, do: acc + 1, else: acc
      else
        acc
      end
    end)
  end

  def walk(room, direction, coordinates, steps) do
    next_cordiantes = next_pos(direction, coordinates)
    next_tile = get_next_tile(room, next_cordiantes)

    cond do
      MapSet.member?(steps, {next_cordiantes, direction}) ->
        :loop

      next_tile == "#" or next_cordiantes == room.obstical ->
        walk(room, turn(direction), coordinates, MapSet.put(steps, {coordinates, direction}))

      next_tile in [".", "^", ">", "V", "<"] ->
        walk(room, direction, next_cordiantes, MapSet.put(steps, {coordinates, direction}))

      next_tile == :out_of_bounds ->
        MapSet.put(steps, {coordinates, direction})
    end
  end

  def next_pos(:up, {x, y}), do: {x - 1, y}
  def next_pos(:right, {x, y}), do: {x, y + 1}
  def next_pos(:down, {x, y}), do: {x + 1, y}
  def next_pos(:left, {x, y}), do: {x, y - 1}

  def get_next_tile(%Room{} = room, xy) do
    case room.coordinates[xy] do
      nil ->
        :out_of_bounds

      value ->
        value
    end
  end

  def turn(:up), do: :right
  def turn(:right), do: :down
  def turn(:down), do: :left
  def turn(:left), do: :up

  def to_room(room) do
    struct!(__MODULE__.Room, obstical: nil, coordinates: room)
  end

  def find_stating_coordinates({_, v}) do
    v in ["V", "<", ">", "^"]
  end

  def get_direction("^"), do: :up
  def get_direction(">"), do: :right
  def get_direction("V"), do: :down
  def get_direction("<"), do: :left

  def parse(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.with_index()
    |> Enum.flat_map(fn {line, row} ->
      line
      |> String.graphemes()
      |> Enum.with_index()
      |> Enum.map(fn {char, col} -> {{row, col}, char} end)
    end)
    |> Enum.into(%{})
  end
end
