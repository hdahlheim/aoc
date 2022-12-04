defmodule Aoc.Aoc2022.D4Test do
  use ExUnit.Case
  alias Aoc.Aoc2022.D4
  doctest Aoc.Aoc2022.D4

  test "part 1" do
    res =
      "./test/aoc2022/input/d4.txt"
      |> File.read!()
      |> D4.part_1()
      |> IO.inspect(label: :part_1)

    assert 602 == res
  end

  test "part 2" do
    res =
      "./test/aoc2022/input/d4.txt"
      |> File.read!()
      |> D4.part_2()
      |> IO.inspect(label: :part_2)

    assert 0 == res
  end
end
