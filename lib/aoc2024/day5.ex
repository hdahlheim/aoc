defmodule Aoc.Aoc2024.Day5 do
  @doc """
  iex> 143 = Aoc.Aoc2024.Day5.part_1(\"""
  iex> 47|53
  iex> 97|13
  iex> 97|61
  iex> 97|47
  iex> 75|29
  iex> 61|13
  iex> 75|53
  iex> 29|13
  iex> 97|29
  iex> 53|29
  iex> 61|53
  iex> 97|53
  iex> 61|29
  iex> 47|13
  iex> 75|47
  iex> 97|75
  iex> 47|61
  iex> 75|61
  iex> 47|29
  iex> 75|13
  iex> 53|13
  iex>
  iex> 75,47,61,53,29
  iex> 97,61,53,29,13
  iex> 75,29,13
  iex> 75,97,47,61,53
  iex> 61,13,29
  iex> 97,13,75,29,47
  iex> \""")
  """
  def part_1(input) do
    {key, puzel} = parse(input)

    Enum.filter(puzel, &is_correct_order?(&1, key))
    |> Enum.map(fn l -> Enum.at(l, div(length(l), 2)) end)
    |> Enum.map(fn n -> String.to_integer(n) end)
    |> Enum.sum()
  end

  @doc """
  iex> 123 = Aoc.Aoc2024.Day5.part_2(\"""
  iex> 47|53
  iex> 97|13
  iex> 97|61
  iex> 97|47
  iex> 75|29
  iex> 61|13
  iex> 75|53
  iex> 29|13
  iex> 97|29
  iex> 53|29
  iex> 61|53
  iex> 97|53
  iex> 61|29
  iex> 47|13
  iex> 75|47
  iex> 97|75
  iex> 47|61
  iex> 75|61
  iex> 47|29
  iex> 75|13
  iex> 53|13
  iex>
  iex> 75,47,61,53,29
  iex> 97,61,53,29,13
  iex> 75,29,13
  iex> 75,97,47,61,53
  iex> 61,13,29
  iex> 97,13,75,29,47
  iex> \""")
  """
  def part_2(input) do
    {key, puzel} = parse(input)

    Enum.reject(puzel, &is_correct_order?(&1, key))
    |> Enum.map(fn line ->
      Enum.sort(
        line,
        fn n1, n2 ->
          k = key[n2]

          cond do
            k != nil and n1 in k -> false
            :otherwise -> true
          end
        end
      )
    end)
    |> Enum.map(fn l -> Enum.at(l, div(length(l), 2)) end)
    |> Enum.map(fn n -> String.to_integer(n) end)
    |> Enum.sum()
  end

  def parse(input) do
    [key, puzel] = String.split(input, "\n\n", trim: true)

    key =
      key
      |> String.split("\n", trim: true)
      |> Enum.reduce(%{}, fn line, acc ->
        [l, r] = String.split(line, "|")
        Map.update(acc, l, [r], fn list -> Enum.reverse([r | list]) end)
      end)

    puzel =
      puzel
      |> String.split("\n", trim: true)
      |> Enum.map(&String.split(&1, ",", trim: true))

    {key, puzel}
  end

  def is_correct_order?(line, key) do
    line_idx = Enum.with_index(line)

    :ok ==
      Enum.reduce_while(line_idx, :ok, fn {num, idx}, _acc ->
        to_check = key[num]

        if check_page_order(idx, line_idx, to_check) do
          {:cont, :ok}
        else
          {:halt, :line_error}
        end
      end)
  end

  def check_page_order(_current_idx, _line_with_idx, to_check) when to_check == nil, do: true

  def check_page_order(current_idx, line_with_idx, to_check) do
    Enum.all?(line_with_idx, fn {v, i} ->
      if v in to_check do
        i > current_idx
      else
        true
      end
    end)
  end
end
