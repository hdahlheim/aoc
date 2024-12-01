defmodule Aoc.Aoc2023.Day1Test do
  use ExUnit.Case
  alias Aoc.Aoc2023.Day1
  doctest Aoc.Aoc2023.Day1

  test "part 1" do
    assert 54630 ==
             "./test/aoc2023/input/day1.txt"
             |> File.read!()
             |> Day1.part_1()
             |> IO.inspect(label: :part1)
  end

  test "part 2" do
    "./test/aoc2023/input/day1.txt"
    |> File.read!()
    |> Day1.part_2()
    |> IO.inspect(label: :part2)
  end
end
