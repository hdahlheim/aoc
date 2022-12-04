defmodule Aoc.Aoc2020.D1 do
  @doc """
  ## Examples

      iex> 514579 = Aoc.Aoc2020.D1.part_1(\"""
      iex> 1721
      iex> 979
      iex> 366
      iex> 299
      iex> 675
      iex> 1456
      iex> \""")
  """
  def part_1(input) do
    {a, b} =
      input
      |> String.split("\n", trim: true)
      |> Enum.map(&String.to_integer/1)
      |> Enum.map(fn n -> {n, 2020 - n} end)
      |> Enum.unzip()

    [x, y] =
      MapSet.intersection(MapSet.new(a), MapSet.new(b))
      |> MapSet.to_list()

    x * y
  end

  @doc """
  ## Examples

      iex> 241861950 = Aoc.Aoc2020.D1.part_2(\"""
      iex> 1721
      iex> 979
      iex> 366
      iex> 299
      iex> 675
      iex> 1456
      iex> \""")
  """
  def part_2(input) do
    numbers =
      input
      |> String.split("\n", trim: true)
      |> Enum.map(&String.to_integer/1)

    [res] =
      for x <- numbers,
          y <- numbers,
          z <- numbers,
          x + y + z == 2020,
          uniq: true do
        x * y * z
      end

    res
  end
end
