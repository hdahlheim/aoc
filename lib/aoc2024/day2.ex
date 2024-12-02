defmodule Aoc.Aoc2024.Day2 do
  import Nx.Defn

  @doc """
  iex> 2 = Aoc.Aoc2024.Day2.part_1(\"""
  iex> 7 6 4 2 1
  iex> 1 2 7 8 9
  iex> 9 7 6 2 1
  iex> 1 3 2 4 5
  iex> 8 6 4 4 1
  iex> 1 3 6 7 9
  iex> \""")
  """
  def part_1(input) do
    parse(input)
    |> Enum.count(fn l ->
      1 ==
        Nx.tensor(l)
        |> safe_line()
        |> Nx.to_number()
    end)
  end

  defn safe_line(t) do
    diff = Nx.diff(t)
    abs = Nx.abs(diff)
    min = Nx.reduce_min(diff)
    max = Nx.reduce_max(diff)
    abs_min = Nx.reduce_min(abs)
    abs_max = Nx.reduce_max(abs)

    (min > 0 or max < 0) and (abs_min >= 1 and abs_max <= 3)
  end

  @doc """
  iex> 4 = Aoc.Aoc2024.Day2.part_2(\"""
  iex> 7 6 4 2 1
  iex> 1 2 7 8 9
  iex> 9 7 6 2 1
  iex> 1 3 2 4 5
  iex> 8 6 4 4 1
  iex> 1 3 6 7 9
  iex> \""")
  """
  def part_2(input) do
    parse(input)
    |> Enum.count(fn l ->
      Enum.any?(0..length(l), fn i ->
        1 ==
          List.delete_at(l, i)
          |> Nx.tensor()
          |> safe_line()
          |> Nx.to_number()
      end)
    end)
  end

  defp parse(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(fn l ->
      l
      |> String.split(" ", trim: true)
      |> Enum.map(&String.to_integer/1)
    end)
  end
end
