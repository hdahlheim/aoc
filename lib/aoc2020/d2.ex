defmodule Aoc.Aoc2020.D2 do
  @doc """
  ## Examples

      iex> 2 = Aoc.Aoc2020.D2.part_1(\"""
      iex> 1-3 a: abcde
      iex> 1-3 b: cdefg
      iex> 2-9 c: ccccccccc
      iex> \""")
  """
  def part_1(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.reduce(0, fn line, acc ->
      [range, key, pw] = String.split(line, " ")

      [s, e] =
        String.split(range, "-")
        |> Enum.map(&String.to_integer/1)

      key = String.trim_trailing(key, ":")

      chars =
        pw
        |> String.graphemes()
        |> Enum.frequencies()

      cond do
        chars[key] in s..e -> acc + 1
        :otherwise -> acc
      end
    end)
  end

  @doc """
  ## Examples

      iex> 1 = Aoc.Aoc2020.D2.part_2(\"""
      iex> 1-3 a: abcde
      iex> 1-3 b: cdefg
      iex> 2-9 c: ccccccccc
      iex> \""")
  """
  def part_2(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.reduce(0, fn line, acc ->
      [indexeis, key, pw] = String.split(line, " ")

      [s, e] =
        String.split(indexeis, "-")
        |> Enum.map(&String.to_integer/1)

      key = String.trim_trailing(key, ":")

      chars = String.graphemes(pw)

      cond do
        Enum.at(chars, s - 1) == key and Enum.at(chars, e - 1) != key -> acc + 1
        Enum.at(chars, e - 1) == key and Enum.at(chars, s - 1) != key -> acc + 1
        :otherwise -> acc
      end
    end)
  end
end
