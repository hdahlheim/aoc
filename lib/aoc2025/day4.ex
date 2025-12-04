defmodule Aoc2025.Day4 do
  @doc """
    iex> 13 = Aoc2025.Day4.part_1(\"""
    iex> ..@@.@@@@.
    iex> @@@.@.@.@@
    iex> @@@@@.@.@@
    iex> @.@@@@..@.
    iex> @@.@@@@.@@
    iex> .@@@@@@@.@
    iex> .@.@.@.@@@
    iex> @.@@@.@@@@
    iex> .@@@@@@@@.
    iex> @.@.@@@.@.
    iex> \""")
  """
  def part_1(input) do
    map = parse(input)

    Enum.map(map, &check_position(&1, map))
    |> Enum.sum()
  end

  @doc """
    iex> 43 = Aoc2025.Day4.part_2(\"""
    iex> ..@@.@@@@.
    iex> @@@.@.@.@@
    iex> @@@@@.@.@@
    iex> @.@@@@..@.
    iex> @@.@@@@.@@
    iex> .@@@@@@@.@
    iex> .@.@.@.@@@
    iex> @.@@@.@@@@
    iex> .@@@@@@@@.
    iex> @.@.@@@.@.
    iex> \""")
  """
  def part_2(input) do
    map = parse(input)

    iterate(map, 0, 0)
  end

  @position_to_check [
    {1, 1},
    {1, -1},
    {-1, 1},
    {-1, -1},
    {0, -1},
    {0, 1},
    {-1, 0},
    {1, 0}
  ]

  def check_position({{_row, _col}, "."}, _map), do: 0

  def check_position({{row, col}, "@"}, map) do
    count =
      @position_to_check
      |> Enum.map(fn {r, c} -> map[{row + r, col + c}] end)
      |> Enum.count(&(&1 == "@"))

    if count < 4, do: 1, else: 0
  end

  defp iterate(_map, acc, 0) when acc != 0, do: acc

  defp iterate(map, acc, _last_score) do
    {total, new_map} =
      Enum.reduce(map, {0, %{}}, fn position, {total, new_map} ->
        score = check_position(position, map)
        new_value = if score == 1, do: ".", else: elem(position, 1)

        {total + score, Map.put(new_map, elem(position, 0), new_value)}
      end)

    iterate(new_map, acc + total, total)
  end

  defp parse(input) do
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
