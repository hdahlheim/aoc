defmodule Aoc.Aoc2024.Day4 do
  @doc """
  iex> 18 = Aoc.Aoc2024.Day4.part_1(\"""
  iex> MMMSXXMASM
  iex> MSAMXMSMSA
  iex> AMXSXMAAMM
  iex> MSAMASMSMX
  iex> XMASAMXAMM
  iex> XXAMMXXAMA
  iex> SMSMSASXSS
  iex> SAXAMASAAA
  iex> MAMMMXMMMM
  iex> MXMXAXMASX
  iex> \""")
  """
  def part_1(input) do
    pattern = "XMAS" |> String.graphemes()
    grid = parse(input)
    size = length(grid)

    for x <- 0..(size - 1), y <- 0..(size - 1) do
      contains_pattern(grid, pattern, x, y, 0, 1) +
        contains_pattern(grid, pattern, x, y, 1, 0) +
        contains_pattern(grid, pattern, x, y, 1, 1) +
        contains_pattern(grid, pattern, x, y, 1, -1)
    end
    |> Enum.sum()
  end

  def contains_pattern(grid, pattern, x, y, dx, dy, acc \\ [])

  def contains_pattern(grid, pattern, x, y, dx, dy, acc)
      when length(acc) < length(pattern) and x < length(grid) and y >= 0 and y < length(grid) do
    next =
      grid
      |> Enum.at(x)
      |> Enum.at(y)

    contains_pattern(grid, pattern, x + dx, y + dy, dx, dy, [next | acc])
  end

  def contains_pattern(_grid, pattern, _x, _y, _dx, _dy, acc) do
    cond do
      acc == pattern or acc == Enum.reverse(pattern) ->
        1

      :otherwise ->
        0
    end
  end

  @doc """
  iex> 9 = Aoc.Aoc2024.Day4.part_2(\"""
  iex> MMMSXXMASM
  iex> MSAMXMSMSA
  iex> AMXSXMAAMM
  iex> MSAMASMSMX
  iex> XMASAMXAMM
  iex> XXAMMXXAMA
  iex> SMSMSASXSS
  iex> SAXAMASAAA
  iex> MAMMMXMMMM
  iex> MXMXAXMASX
  iex> \""")
  """
  def part_2(input) do
    pattern = "MAS" |> String.graphemes()
    grid = parse(input)
    size = length(grid)

    for x <- 0..(size - 1), y <- 0..(size - 1) do
      if contains_pattern(grid, pattern, x, y, 1, 1) == 1 and
           contains_pattern(grid, pattern, x, y + 2, 1, -1) == 1 do
        1
      else
        0
      end
    end
    |> Enum.sum()
  end

  defp parse(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.split(&1, "", trim: true))
  end
end
