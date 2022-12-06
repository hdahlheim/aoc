defmodule Aoc.Aoc2022.D6 do
  @doc """
  ## Examples

      iex> 7 = Aoc.Aoc2022.D6.part_1("mjqjpqmgbljsphdztnvjfqwrcgsmlb")
      iex> 5 = Aoc.Aoc2022.D6.part_1("bvwbjplbgvbhsrlpgdmjqwftvncz")
      iex> 6 = Aoc.Aoc2022.D6.part_1("nppdvjthqldpwncqszvftbrmjlhg")
  """
  def part_1(input) do
    index_after_uniq_elements(input, 4)
  end

  @doc """
  ## Examples

      iex> 19 = Aoc.Aoc2022.D6.part_2("mjqjpqmgbljsphdztnvjfqwrcgsmlb")
      iex> 23 = Aoc.Aoc2022.D6.part_2("bvwbjplbgvbhsrlpgdmjqwftvncz")
      iex> 23 = Aoc.Aoc2022.D6.part_2("nppdvjthqldpwncqszvftbrmjlhg")
  """
  def part_2(input) do
    index_after_uniq_elements(input, 14)
  end

  def index_after_uniq_elements(list, length) do
    list
    |> String.to_charlist()
    |> Enum.chunk_every(length, 1)
    |> Enum.reduce_while(length, fn list, acc ->
      case length(Enum.uniq(list)) == length do
        true -> {:halt, acc}
        false -> {:cont, acc + 1}
      end
    end)
  end
end
