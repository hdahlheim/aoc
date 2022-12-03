defmodule Aoc.Aoc2022.D3 do
  @doc """
  ## Examples

      iex> 157 = Aoc.Aoc2022.D3.part_1(\"""
      iex> vJrwpWtwJgWrhcsFMMfFFhFp
      iex> jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
      iex> PmmdzqPrVvPwwTWBwg
      iex> wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
      iex> ttgJtRGJQctTZtZT
      iex> CrZsJsPPZsGzwwsLwLmpwMDw
      iex> \""")
  """
  def part_1(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.reduce(0, fn line, acc ->
      list = String.to_charlist(line)
      [a, b] = Enum.chunk_every(list, div(length(list), 2))
      [c] = Enum.uniq(a -- a -- b)
      acc + codepoint_to_prio(c)
    end)
  end

  def codepoint_to_prio(c) when c in ?a..?z, do: c - 96
  def codepoint_to_prio(c) when c in ?A..?Z, do: c - 38

  @doc """
  ## Examples

      iex> 70 = Aoc.Aoc2022.D3.part_2(\"""
      iex> vJrwpWtwJgWrhcsFMMfFFhFp
      iex> jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
      iex> PmmdzqPrVvPwwTWBwg
      iex> wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
      iex> ttgJtRGJQctTZtZT
      iex> CrZsJsPPZsGzwwsLwLmpwMDw
      iex> \""")
  """
  def part_2(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.chunk_every(3)
    |> Enum.reduce(0, fn groups, acc ->
      [ga, gb, gc] = Enum.map(groups, &String.to_charlist/1)

      [c] =
        ga
        |> Enum.filter(fn c -> c in gb and c in gc end)
        |> Enum.uniq()

      acc + codepoint_to_prio(c)
    end)
  end
end
