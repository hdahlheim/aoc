defmodule Aoc.Aoc2024.Day3 do
  @regex ~r/do\(\)|don't\(\)|mul\((\d{1,3}),(\d{1,3})\)/

  @doc """
  iex> 161 = Aoc.Aoc2024.Day3.part_1(\"xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))\")
  """
  def part_1(input) do
    Regex.scan(@regex, input)
    |> Enum.reduce(
      {:enabled, 0},
      fn
        [_, a, b], {_, count} ->
          {:enabled, count + String.to_integer(a) * String.to_integer(b)}

        _, acc ->
          acc
      end
    )
    |> elem(1)
  end

  @doc """
  iex> 48 = Aoc.Aoc2024.Day3.part_2(\"xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))\")
  """
  def part_2(input) do
    Regex.scan(@regex, input)
    |> Enum.reduce(
      {:enabled, 0},
      fn
        [<<"mul", _rest::binary>>, a, b], {:enabled, count} ->
          {:enabled, count + String.to_integer(a) * String.to_integer(b)}

        [<<"mul", _rest::binary>>, _a, _b], {:disabled, count} ->
          {:disabled, count}

        ["do()"], {_, count} ->
          {:enabled, count}

        ["don't()"], {_, count} ->
          {:disabled, count}
      end
    )
    |> elem(1)
  end
end
