defmodule Aoc.Aoc2024.Day5Test do
  use ExUnit.Case
  alias Aoc.Aoc2024.Day5
  doctest Aoc.Aoc2024.Day5

  test "aoc day5 part1" do
    assert 5391 ==
             "./test/aoc2024/input/day5.txt"
             |> File.read!()
             |> Day5.part_1()
             |> IO.inspect(label: :part1)
  end

  test "aoc day5 part2" do
    assert 6142 ==
             "./test/aoc2024/input/day5.txt"
             |> File.read!()
             |> Day5.part_2()
             |> IO.inspect(label: :part2)
  end
end
