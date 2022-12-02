defmodule Aoc.Aoc2022.D2 do
  @doc """
  ## Examples

      iex> 15 = Aoc.Aoc2022.D2.part_1(\"""
      iex> A Y
      iex> B X
      iex> C Z
      iex> \""")
  """
  def part_1(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(fn
      "A X" -> 3 + 1
      "A Y" -> 6 + 2
      "A Z" -> 0 + 3
      "B X" -> 0 + 1
      "B Y" -> 3 + 2
      "B Z" -> 6 + 3
      "C X" -> 6 + 1
      "C Y" -> 0 + 2
      "C Z" -> 3 + 3
    end)
    |> Enum.sum()
  end

  @doc """
  ## Examples

      iex> 12 = Aoc.Aoc2022.D2.part_2(\"""
      iex> A Y
      iex> B X
      iex> C Z
      iex> \""")
  """
  def part_2(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(fn
      "A X" -> 3 + 0
      "A Y" -> 1 + 3
      "A Z" -> 2 + 6
      "B X" -> 1 + 0
      "B Y" -> 2 + 3
      "B Z" -> 3 + 6
      "C X" -> 2 + 0
      "C Y" -> 3 + 3
      "C Z" -> 1 + 6
    end)
    |> Enum.sum()
  end
end
