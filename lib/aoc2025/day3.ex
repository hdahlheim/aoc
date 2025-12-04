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

    num_digits = 2

    batteries
    |> Enum.reduce(0, fn battery, acc ->
      old_digits = old_get_numbers(battery)

      digits =
        get_numbers(battery, [], num_digits)
        |> Enum.sort_by(&elem(&1, 1))
        |> Enum.map(&elem(&1, 0))

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

    num_digits = 12

    batteries
    |> Enum.reduce(0, fn battery, acc ->
      digits =
        get_numbers(battery, [], num_digits)
        |> Enum.sort_by(&elem(&1, 1))
        |> Enum.map(&elem(&1, 0))
        |> IO.inspect()

      acc + Integer.undigits(digits)
    end)
  end

  defp get_numbers(battery, [], num_digits) do
    battery_length = length(battery)
    initial_max = {a, idx_a} = Enum.max_by(battery, &elem(&1, 0))

    haystack =
      cond do
        idx_a <= battery_length - num_digits ->
          Enum.filter(battery, &(elem(&1, 1) > idx_a))

        :else ->
          battery -- [{a, idx_a}]
      end

    get_numbers(haystack, [initial_max], num_digits - 1)
  end

  defp get_numbers(_battery, acc, 0), do: acc

  defp get_numbers(battery, acc, num_digits) do
    battery_length = length(battery)

    a = Enum.max_by(battery, &elem(&1, 0))
    idx = Enum.find_index(battery, &(&1 == a))

    haystack =
      cond do
        idx <= battery_length - num_digits ->
          Enum.filter(battery, &(elem(&1, 1) > elem(a, 1)))

        :else ->
          haystack = battery -- [a]
      end

    get_numbers(haystack, [a | acc], num_digits - 1)
  end

  defp old_get_numbers(battery) do
    {a, idx_a} = Enum.max_by(battery, &elem(&1, 0))
    {b, idx_b} = Enum.max_by(battery -- [{a, idx_a}], &elem(&1, 0))
    c = Enum.filter(battery, &(elem(&1, 1) > idx_a))

    cond do
      idx_a > idx_b and is_tuple(c) ->
        [a, elem(c, 0)]

      :else ->
        [b, a]
    end
  end

  defp parse(input) do
    String.split(input, "\n", trim: true)
    |> Enum.map(fn s -> String.to_integer(s) |> Integer.digits() |> Enum.with_index() end)
  end
end
