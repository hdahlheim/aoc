defmodule Aoc.Aoc2024.Day1 do
  @doc """
    iex> 11 = Aoc.Aoc2024.Day1.part_1(\"""
    iex> 3   4
    iex> 4   3
    iex> 2   5
    iex> 1   3
    iex> 3   9
    iex> 3   3
    iex> \""")
  """
  def part_1(input) do
    t =
      input
      |> parse()
      |> Nx.tensor(names: [:h, :v])
      |> Nx.sort(axis: :h)

    Nx.subtract(t[[.., 0]], t[[.., 1]])
    |> Nx.abs()
    |> Nx.sum()
    |> Nx.to_number()
  end

  @doc """
    iex> 31 = Aoc.Aoc2024.Day1.part_2(\"""
    iex> 3   4
    iex> 4   3
    iex> 2   5
    iex> 1   3
    iex> 3   9
    iex> 3   3
    iex> \""")
  """
  def part_2(input) do
    t =
      input
      |> parse()
      |> Nx.tensor(names: [:h, :v])
      |> Nx.sort(axis: :h)

    counts =
      Nx.to_flat_list(t[[.., 1]])
      |> Enum.frequencies()

    Nx.to_flat_list(t[[.., 0]])
    |> Enum.reduce(0, fn v, acc ->
      m = Map.get(counts, v, 0)

      acc + v * m
    end)
  end

  defp parse(input) do
    input
    |> String.split(["   ", "\n"], trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Enum.chunk_every(2)
  end
end
