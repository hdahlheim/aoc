defmodule Aoc.Aoc2024.Day7 do
  @doc """
  iex> 3749 = Aoc.Aoc2024.Day7.part_1(\"""
  iex> 190: 10 19
  iex> 3267: 81 40 27
  iex> 83: 17 5
  iex> 156: 15 6
  iex> 7290: 6 8 6 15
  iex> 161011: 16 10 13
  iex> 192: 17 8 14
  iex> 21037: 9 7 18 13
  iex> 292: 11 6 16 20
  iex> \""")
  """
  def part_1(input) do
    ops = [&+/2, &*/2]

    parse(input)
    |> Enum.map(&find_solution(&1, ops))
    |> Enum.sum()
  end

  def find_solution(list, operations) do
    test = hd(list)
    components = tl(list)

    permutations =
      Enum.reduce(tl(components), [hd(components)], fn value, acc ->
        for total <- acc, op <- operations do
          apply(op, [total, value])
        end
      end)

    if Enum.any?(permutations, fn total -> total == test end), do: test, else: 0
  end

  @doc """
  iex> 11387 = Aoc.Aoc2024.Day7.part_2(\"""
  iex> 190: 10 19
  iex> 3267: 81 40 27
  iex> 83: 17 5
  iex> 156: 15 6
  iex> 7290: 6 8 6 15
  iex> 161011: 16 10 13
  iex> 192: 17 8 14
  iex> 21037: 9 7 18 13
  iex> 292: 11 6 16 20
  iex> \""")
  """
  def part_2(input) do
    ops = [&+/2, &*/2, &String.to_integer("#{&1}#{&2}")]

    parse(input)
    |> Enum.map(&find_solution(&1, ops))
    |> Enum.sum()
  end

  def parse(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(fn l ->
      l
      |> String.split([": ", " "], trim: true)
      |> Enum.map(&String.to_integer/1)
    end)
  end
end
