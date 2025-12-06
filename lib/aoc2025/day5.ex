defmodule Aoc2025.Day5 do
  @doc """
  iex> 3 = Aoc2025.Day5.part_1(\"""
  iex> 3-5
  iex> 10-14
  iex> 16-20
  iex> 12-18
  iex>
  iex> 1
  iex> 5
  iex> 8
  iex> 11
  iex> 17
  iex> 32
  iex> \""")
  """
  def part_1(input) do
    {ranges, ids} = parse(input)

    Enum.reduce(ids, 0, fn id, acc ->
      res = Enum.any?(ranges, fn range -> id in range end)

      if res, do: acc + 1, else: acc
    end)
  end

  @doc """
  iex> 14 = Aoc2025.Day5.part_2(\"""
  iex> 3-5
  iex> 10-14
  iex> 16-20
  iex> 12-18
  iex>
  iex> 1
  iex> 5
  iex> 8
  iex> 11
  iex> 17
  iex> 32
  iex> \""")
  """
  def part_2(input) do
    {ranges, _ids} = parse(input)

    head = hd(ranges)
    rest = tl(ranges)

    Enum.reduce(rest, [head], fn range, [last_range | rest] ->
      if Range.disjoint?(range, last_range) do
        [range, last_range | rest]
      else
        [min(range.first, last_range.first)..max(range.last, last_range.last) | rest]
      end
    end)
    |> Enum.sum_by(&Range.size/1)
  end

  def parse(input) do
    [h, t] = String.split(input, "\n\n", trim: true)

    ranges =
      String.split(h, "\n", trim: true)
      |> Enum.map(fn l ->
        [low, high] =
          String.split(l, "-", trim: true)
          |> Enum.map(&String.to_integer/1)

        low..high
      end)
      |> Enum.sort()

    ids =
      String.split(t, "\n", trim: true)
      |> Enum.map(&String.to_integer/1)

    {ranges, ids}
  end
end
