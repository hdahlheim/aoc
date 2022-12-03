defmodule Aoc.Aoc2022.D3Test do
  use ExUnit.Case
  alias Aoc.Aoc2022.D3
  doctest Aoc.Aoc2022.D3

  test "part 1" do
    res =
      "./test/aoc2022/input/d3.txt"
      |> File.read!()
      |> D3.part_1()
      |> IO.inspect(label: :part_1)

    assert 8176 == res
  end

  test "part 2" do
    res =
      "./test/aoc2022/input/d3.txt"
      |> File.read!()
      |> D3.part_2()
      |> IO.inspect(label: :part_2)

    assert 2689 == res
  end
end
