defmodule Aoc2025.Day2 do
  @doc """
    iex> 1227775554 = Aoc2025.Day2.part_1("11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124")
  """
  def part_1(input) do
    input
    |> parse()
    |> Enum.reduce(0, fn range, acc ->
      sum =
        parse_range(range)
        |> Enum.reduce(0, fn number, acc ->
          is_invalid =
            Integer.to_string(number)
            |> invalid_id(~r/^(\d+)\1$/)

          if is_invalid, do: acc + number, else: acc
        end)

      acc + sum
    end)
  end

  @doc """
    iex> 4174379265 = Aoc2025.Day2.part_2("11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124")
  """
  def part_2(input) do
    input
    |> parse()
    |> Enum.reduce(0, fn range, acc ->
      sum =
        parse_range(range)
        |> Enum.reduce(0, fn number, acc ->
          is_invalid =
            Integer.to_string(number)
            |> invalid_id(~r/^(\d+)(\1)+$/)

          if is_invalid, do: acc + number, else: acc
        end)

      acc + sum
    end)
  end

  defp parse(input) do
    String.split(input, ",", trim: true)
  end

  defp parse_range(range) do
    [s, e] = String.split(range, "-")

    String.to_integer(s)..String.to_integer(e)
  end

  defp invalid_id("0" <> _, _), do: true
  defp invalid_id(id, pattern), do: Regex.match?(pattern, id)
  defp invalid_id(_, _), do: false
end
