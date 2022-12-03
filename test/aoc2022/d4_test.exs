defmodule Aoc.Aoc2022.D4Test do
  use ExUnit.Case
  alias Aoc.Aoc2022.D4
  doctest Aoc.Aoc2022.D4

  @tag :skip
  test "part 1" do
    res =
      "./test/aoc2022/input/d4.txt"
      |> File.read!()
      |> D4.part_1()
      |> IO.inspect(label: :part_1)

    assert _ == res
  end

  @tag :skip
  test "part 2" do
    res =
      "./test/aoc2022/input/d4.txt"
      |> File.read!()
      |> D4.part_2()
      |> IO.inspect(label: :part_2)

    assert _ == res
  end
end
