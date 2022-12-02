defmodule Aoc.Aoc2022.D1 do
  @doc """
  ## Examples

      iex> Aoc.Aoc2022.D1.part_1(\"""
      iex> 1000
      iex> 2000
      iex> 3000
      iex>
      iex> 4000
      iex>
      iex> 5000
      iex> 6000
      iex>
      iex> 7000
      iex> 8000
      iex> 9000
      iex>
      iex> 10000
      iex> \""")
  """
  def part_1(input) do
    input
    |> parse_input()
    |> Enum.map(&Enum.sum/1)
    |> Enum.max()
  end

  @doc """
  ## Examples

      iex> Aoc.Aoc2022.D1.part_2(\"""
      iex> 1000
      iex> 2000
      iex> 3000
      iex>
      iex> 4000
      iex>
      iex> 5000
      iex> 6000
      iex>
      iex> 7000
      iex> 8000
      iex> 9000
      iex>
      iex> 10000
      iex> \""")
  """
  def part_2(input) do
    input
    |> parse_input()
    |> Enum.map(&Enum.sum/1)
    |> Enum.sort(:desc)
    |> Enum.take(3)
    |> Enum.sum()
  end

  defp parse_input(input) do
    String.split(input, "\n\n")
    |> Enum.map(fn chunk ->
      String.split(chunk, "\n", trim: true) |> Enum.map(&String.to_integer/1)
    end)
  end
end
