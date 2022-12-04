defmodule Aoc.Aoc2022.D4 do
  @doc """
  ## Examples

      iex> 2 = Aoc.Aoc2022.D4.part_1(\"""
      iex> 2-4,6-8
      iex> 2-3,4-5
      iex> 5-7,7-9
      iex> 2-8,3-7
      iex> 6-6,4-6
      iex> 2-6,4-8
      iex> \""")
  """
  def part_1(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.reduce(0, fn line, acc ->
      [m1, m2] = line_to_mapsets(line)

      cond do
        MapSet.subset?(m1, m2) -> acc + 1
        MapSet.subset?(m2, m1) -> acc + 1
        :otherwise -> acc
      end
    end)
  end

  @doc """
  ## Examples

      iex> 4 = Aoc.Aoc2022.D4.part_2(\"""
      iex> 2-4,6-8
      iex> 2-3,4-5
      iex> 5-7,7-9
      iex> 2-8,3-7
      iex> 6-6,4-6
      iex> 2-6,4-8
      iex> \""")
  """
  def part_2(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.reduce(0, fn line, acc ->
      [m1, m2] = line_to_mapsets(line)
      IO.inspect(MapSet.subset?(m1, m2))

      cond do
        !MapSet.disjoint?(m1, m2) -> acc + 1
        :otherwise -> acc
      end
    end)
  end

  defp line_to_mapsets(line) do
    line
    |> String.split(",")
    |> Enum.map(fn range ->
      [s, e] =
        range
        |> String.split("-")
        |> Enum.map(&String.to_integer/1)

      MapSet.new(s..e)
    end)
  end
end
