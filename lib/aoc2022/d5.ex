defmodule Aoc.Aoc2022.D5 do
  @doc """
  ## Examples

      iex> "CMZ" = Aoc.Aoc2022.D5.part_1(\"""
      iex>     [D]
      iex> [N] [C]
      iex> [Z] [M] [P]
      iex>  1   2   3
      iex>
      iex> move 1 from 2 to 1
      iex> move 3 from 1 to 3
      iex> move 2 from 2 to 1
      iex> move 1 from 1 to 2
      iex> \""")
  """
  def part_1(input) do
    {stacks, moves} = parse_input(input)

    Enum.reduce(moves, stacks, fn {amount, from, to}, stacks ->
      from_stack = elem(stacks, from - 1)
      to_stack = elem(stacks, to - 1)

      stacks
      |> put_elem(from - 1, Enum.drop(from_stack, amount))
      |> put_elem(to - 1, Enum.reverse(Enum.take(from_stack, amount)) ++ to_stack)
    end)
    |> Tuple.to_list()
    |> Enum.map(&hd(&1))
    |> List.to_string()
  end

  @doc """
  ## Examples

      iex> "MCD" = Aoc.Aoc2022.D5.part_2(\"""
      iex>     [D]
      iex> [N] [C]
      iex> [Z] [M] [P]
      iex>  1   2   3
      iex>
      iex> move 1 from 2 to 1
      iex> move 3 from 1 to 3
      iex> move 2 from 2 to 1
      iex> move 1 from 1 to 2
      iex> \""")
  """
  def part_2(input) do
    {stacks, moves} = parse_input(input)

    Enum.reduce(moves, stacks, fn {amount, from, to}, stacks ->
      from_stack = elem(stacks, from - 1)
      to_stack = elem(stacks, to - 1)

      stacks
      |> put_elem(from - 1, Enum.drop(from_stack, amount))
      |> put_elem(to - 1, Enum.take(from_stack, amount) ++ to_stack)
    end)
    |> Tuple.to_list()
    |> Enum.map(&hd(&1))
    |> List.to_string()
  end

  def parse_input(input) do
    [raw_stacks, raw_moves] =
      input
      |> String.split("\n\n")

    {cols, raw_stacks} =
      raw_stacks
      |> String.split("\n", trim: true)
      |> List.pop_at(-1)

    stacks =
      raw_stacks
      |> Enum.map(fn line ->
        line
        |> String.pad_trailing(String.length(cols))
        |> String.to_charlist()
        |> Enum.chunk_every(4)
        |> Enum.map(&Enum.at(&1, 1))
      end)
      |> Enum.zip_with(& &1)
      |> Enum.map(fn stack -> Enum.filter(stack, &(&1 != ?\s)) end)
      |> List.to_tuple()

    moves =
      raw_moves
      |> String.split("\n", trim: true)
      |> Enum.map(fn line ->
        line
        |> String.split()
        |> Enum.drop_every(2)
        |> Enum.map(&String.to_integer/1)
        |> List.to_tuple()
      end)

    {stacks, moves}
  end
end
