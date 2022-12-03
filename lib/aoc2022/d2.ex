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
    |> Enum.reduce(0, fn
      "A X", acc -> acc + 3 + 1
      "A Y", acc -> acc + 6 + 2
      "A Z", acc -> acc + 0 + 3
      "B X", acc -> acc + 0 + 1
      "B Y", acc -> acc + 3 + 2
      "B Z", acc -> acc + 6 + 3
      "C X", acc -> acc + 6 + 1
      "C Y", acc -> acc + 0 + 2
      "C Z", acc -> acc + 3 + 3
    end)
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
    |> Enum.reduce(0, fn
      "A X", acc -> acc + 3 + 0
      "A Y", acc -> acc + 1 + 3
      "A Z", acc -> acc + 2 + 6
      "B X", acc -> acc + 1 + 0
      "B Y", acc -> acc + 2 + 3
      "B Z", acc -> acc + 3 + 6
      "C X", acc -> acc + 2 + 0
      "C Y", acc -> acc + 3 + 3
      "C Z", acc -> acc + 1 + 6
    end)
  end
end
