defmodule Aoc.Aoc2023.Day2 do
  @doc """
  Example
      iex> 8 = Aoc.Aoc2023.Day2.part_1(\"""
      iex> Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
      iex> Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
      iex> Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
      iex> Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
      iex> Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
      iex> \""")
  """
  def part_1(input) do
    allowed = %{
      "red" => 12,
      "green" => 13,
      "blue" => 14
    }

    input
    |> String.split("\n", trim: true)
    |> Enum.reduce(0, fn game, acc ->
      ["Game " <> id, sets] = String.split(game, ":")

      sets =
        sets
        |> String.split([";"], trim: true)
        |> Enum.map(fn set ->
          String.split(set, ",")
          |> Enum.map(fn group ->
            [count, color] =
              group
              |> String.trim()
              |> String.split(" ")

            String.to_integer(count) <= allowed[color]
          end)
          |> Enum.all?()
        end)

      if Enum.all?(sets) do
        String.to_integer(id) + acc
      else
        acc
      end
    end)
  end

  @doc """
  Example
      iex> 2286 = Aoc.Aoc2023.Day2.part_2(\"""
      iex> Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
      iex> Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
      iex> Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
      iex> Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
      iex> Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
      iex> \""")
  """
  def part_2(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.reduce(0, fn game, acc ->
      [_, sets] = String.split(game, ":")

      power =
        sets
        |> String.split(";", trim: true)
        |> Enum.map(fn set ->
          min =
            String.split(set, ",", trim: true)
            |> Enum.reduce(%{"red" => 0, "green" => 0, "blue" => 0}, fn group, min ->
              [count, color] =
                group
                |> String.trim()
                |> String.split(" ")

              count = String.to_integer(count)

              if count > min[color] do
                %{min | color => count}
              else
                min
              end
              |> IO.inspect()
            end)

          min["red"] * min["green"] * min["blue"]
        end)
        |> Enum.sum()
        |> IO.inspect()

      acc + power
    end)
  end
end
