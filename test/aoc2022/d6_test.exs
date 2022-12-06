defmodule Aoc.Aoc2022.D6Test do
  use ExUnit.Case
  alias Aoc.Aoc2022.D6
  doctest Aoc.Aoc2022.D6

  test "part 1" do
    res =
      "./test/aoc2022/input/d6.txt"
      |> File.read!()
      |> String.trim_trailing("\n")
      |> D6.part_1()
      |> IO.inspect(label: :part_1)

    assert res
  end

  test "part 2" do
    res =
      "./test/aoc2022/input/d6.txt"
      |> File.read!()
      |> String.trim_trailing("\n")
      |> D6.part_2()
      |> IO.inspect(label: :part_2)

    assert res
  end
end
