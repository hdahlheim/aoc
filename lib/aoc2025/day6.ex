defmodule Aoc2025.Day6 do
  @doc """
    iex> 4277556 = Aoc2025.Day6.part_1(\"""
    iex> 123 328  51 64
    iex>  45 64  387 23
    iex>   6 98  215 314
    iex> *   +   *   +
    iex> \""")
  """
  def part_1(input) do
    parse_1(input)
    |> Enum.reduce(0, fn [instruction | values], acc ->
      op = to_operator(instruction)

      acc + Enum.reduce(values, initial_value(instruction), op)
    end)
  end

  @doc """
    iex> 3263827 = Aoc2025.Day6.part_2(\"""
    iex> 123 328  51 64
    iex>  45 64  387 23
    iex>   6 98  215 314
    iex> *   +   *   +
    iex> \""")
  """
  def part_2(input) do
    {instructions, all_values} = parse_2(input)

    Enum.reduce(
      instructions,
      {0, all_values},
      fn instruction, {current_total, [values | rest]} ->
        op = to_operator(instruction)
        res = Enum.reduce(values, initial_value(instruction), op)

        {current_total + res, rest}
      end
    )
    |> elem(0)
  end

  def initial_value("+"), do: 0
  def initial_value("*"), do: 1
  def to_operator("+"), do: &+/2
  def to_operator("*"), do: &*/2

  def parse_1(input) do
    [operators | values] =
      String.split(input, "\n", trim: true)
      |> Enum.reverse()
      |> Enum.map(fn l -> String.split(l, " ", trim: true) end)

    values = Enum.map(values, fn l -> Enum.map(l, &String.to_integer(&1)) end)

    [operators | values]
    |> Enum.zip()
    |> Enum.map(&Tuple.to_list/1)
  end

  def parse_2(input) do
    [operators | values] =
      String.split(input, "\n", trim: true)
      |> Enum.reverse()
      |> Enum.map(fn l -> String.split(l, "") end)

    instructions =
      Enum.map(operators, &String.trim/1)
      |> Enum.filter(&(&1 != ""))

    values =
      values
      |> Enum.reverse()
      |> Enum.zip()
      |> Enum.map(fn row ->
        res =
          Tuple.to_list(row)
          |> Enum.join()
          |> String.trim()
          |> Integer.parse()

        if is_tuple(res), do: elem(res, 0)
      end)
      |> Enum.chunk_by(&is_nil/1)
      |> Enum.filter(&(&1 != [nil]))

    {instructions, values}
  end
end
