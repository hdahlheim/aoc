defmodule Aoc.Aoc2022.D2Test do
  use ExUnit.Case
  alias Aoc.Aoc2022.D2
  doctest Aoc.Aoc2022.D2

  test "part 1" do
    res =
      "./test/aoc2022/input/d2.txt"
      |> File.read!()
      |> D2.part_1()
      |> IO.inspect(label: :part_1)

    assert 14163 == res
  end

  test "part 2" do
    res =
      "./test/aoc2022/input/d2.txt"
      |> File.read!()
      |> D2.part_2()
      |> IO.inspect(label: :part_2)

    assert 12091 == res
  end
end
