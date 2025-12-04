defmodule Aoc2025.Day1 do
  @start 50
  @total_steps 100

  @doc """
    iex> 3 = Aoc2025.Day1.part_1(\"""
    iex> L68
    iex> L30
    iex> R48
    iex> L5
    iex> R60
    iex> L55
    iex> L1
    iex> L99
    iex> R14
    iex> L82
    iex> \""")
  """
  def part_1(input) do
    input
    |> parse()
    |> Enum.reduce(
      {@start, 0},
      fn
        {dir, steps}, {pos, counter} ->
          steps =
            case dir do
              ?R -> +steps
              ?L -> -steps
            end

          pos = Integer.mod(pos + steps, @total_steps)

          new_counter = if pos === 0, do: counter + 1, else: counter

          {pos, new_counter}
      end
    )
    |> elem(1)
  end

  @doc """
    iex> 6 = Aoc2025.Day1.part_2(\"""
    iex> L68
    iex> L30
    iex> R48
    iex> L5
    iex> R60
    iex> L55
    iex> L1
    iex> L99
    iex> R14
    iex> L82
    iex> \""")
  """
  def part_2(input) do
    input
    |> parse()
    |> Enum.reduce(
      {@start, 0},
      fn
        {dir, steps}, {start, counter} ->
          delta = to_delta(dir, steps)
          target = start + delta

          new_start = Integer.mod(start + delta, @total_steps)
          rotations = div(abs(delta), @total_steps)

          wrapped =
            start != 0 and
              (start + rem(delta, @total_steps) <= 0 or start + rem(delta, 100) >= @total_steps)

          new_counter = counter + rotations + if wrapped, do: 1, else: 0

          # current_block = Integer.floor_div(start, @total_steps)
          # target_block = Integer.floor_div(target, @total_steps)

          # wraps = abs(target_block - current_block)

          {new_start, new_counter}
      end
    )
    |> elem(1)
  end

  defp to_delta(?R, steps), do: +steps
  defp to_delta(?L, steps), do: -steps

  # defp calc_wraps(0, delta), do: div(abs(delta), @total_steps)
  # defp calc_wraps(start, delta), do: abs(Integer.floor_div(start + delta, @total_steps))

  defp parse(input) do
    String.split(input, "\n", trim: true)
    |> Enum.map(fn <<d::8, val::binary>> -> {d, String.to_integer(val)} end)
  end
end
