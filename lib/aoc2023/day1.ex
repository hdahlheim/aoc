defmodule Aoc.Aoc2023.Day1 do
  @doc """
  Example

      iex> 142 = Aoc.Aoc2023.Day1.part_1(\"""
      iex> 1abc2
      iex> pqr3stu8vwx
      iex> a1b2c3d4e5f
      iex> treb7uchet
      iex> \""")
  """
  def part_1(input) do
    input
    |> parse_input
    |> Enum.reduce(0, fn line, acc ->
      num =
        line
        |> String.graphemes()
        |> Enum.filter(fn c -> c in allowed_values() end)
        |> then(fn ints ->
          [List.first(ints, 0), List.last(ints, 0)]
        end)
        |> Enum.join()
        |> String.to_integer()

      num + acc
    end)
  end

  @doc """
  Example

      iex> 281 = Aoc.Aoc2023.Day1.part_2(\"""
      iex> two1nine
      iex> eightwothree
      iex> abcone2threexyz
      iex> xtwone3four
      iex> 4nineeightseven2
      iex> zoneight234
      iex> 7pqrstsixteen
      iex> \""")
  """
  def part_2(input) do
    input
    |> parse_input
    |> Enum.reduce(0, fn line, acc ->
      num =
        line
        |> String.replace(replacer_values(), &replacer/1)
        |> String.graphemes()
        |> Enum.filter(fn c -> c in allowed_values() end)
        |> then(fn ints ->
          [List.first(ints, 0), List.last(ints, 0)]
        end)
        |> Enum.join()
        |> String.to_integer()

      num + acc
    end)
  end

  def parse_input(input) do
    input
    |> String.split("\n", trim: true)
  end

  def replacer_values() do
    [
      "oneight",
      "nineight",
      "eighthree",
      "eightwo",
      "sevenine",
      "one",
      "two",
      "three",
      "four",
      "five",
      "six",
      "seven",
      "eight",
      "nine"
    ]
  end

  def allowed_values() do
    ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
  end

  def replacer(num) do
    case num do
      "oneight" -> "18"
      "nineight" -> "98"
      "eighthree" -> "83"
      "eightwo" -> "82"
      "sevenine" -> "79"
      "one" -> "1"
      "two" -> "2"
      "three" -> "3"
      "four" -> "4"
      "five" -> "5"
      "six" -> "6"
      "seven" -> "7"
      "eight" -> "8"
      "nine" -> "9"
    end
  end
end
