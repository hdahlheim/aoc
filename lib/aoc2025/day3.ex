defmodule Aoc2025.Day3 do
  @doc """
    iex> 357 = Aoc2025.Day3.part_1(\"""
    iex> 987654321111111
    iex> 811111111111119
    iex> 234234234234278
    iex> 818181911112111
    iex> \""")
  """
  def part_1(input) do
    batteries = parse(input)

    batteries
    |> Enum.reduce(0, fn battery, acc ->
      digits = joltage_value(battery, 2)

      acc + Integer.undigits(digits)
    end)
  end

  @doc """
    iex> 3121910778619 = Aoc2025.Day3.part_2(\"""
    iex> 987654321111111
    iex> 811111111111119
    iex> 234234234234278
    iex> 818181911112111
    iex> \""")
  """
  def part_2(input) do
    batteries = parse(input)

    batteries
    |> Enum.reduce(0, fn battery, acc ->
      digits = joltage_value(battery, 12)

      acc + Integer.undigits(digits)
    end)
  end

  defp joltage_value(battery, digits) do
    get_next_value(battery, digits, [])
    |> Enum.reverse()
  end

  defp get_next_value(_battery, 0, acc), do: acc

  defp get_next_value(battery, remaining_digits, acc) do
    len = length(battery)
    l1 = Enum.take(battery, len - (remaining_digits - 1))
    n = Enum.max(l1)
    new_idx = Enum.find_index(l1, &(&1 == n)) + 1

    new_list = Enum.drop(battery, new_idx)
    get_next_value(new_list, remaining_digits - 1, [n | acc])
  end

  defp parse(input) do
    String.split(input, "\n", trim: true)
    |> Enum.map(fn s -> String.to_integer(s) |> Integer.digits() end)
  end
end
