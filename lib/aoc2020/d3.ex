defmodule Aoc.Aoc2020.D3 do
  @doc """
  ## Examples

      iex> 2 = Aoc.Aoc2020.D3.part_1(\"""
      iex>..##.......
      iex>#...#...#..
      iex>.#....#..#.
      iex>..#.#...#.#
      iex>.#...##..#.
      iex>..#.##.....
      iex>.#.#.#....#
      iex>.#........#
      iex>#.##...#...
      iex>#...##....#
      iex>.#..#...#.#
      iex>\""")
  """
  def part_1(input) do
    input
    |> String.split("\n", trim: true)
  end

  @doc """
  ## Examples

      iex> 1 = Aoc.Aoc2020.D3.part_2(\"""
      iex>..##.......
      iex>#...#...#..
      iex>.#....#..#.
      iex>..#.#...#.#
      iex>.#...##..#.
      iex>..#.##.....
      iex>.#.#.#....#
      iex>.#........#
      iex>#.##...#...
      iex>#...##....#
      iex>.#..#...#.#
      iex> \""")
  """
  def part_2(input) do
    input
    |> String.split("\n", trim: true)
  end
end
