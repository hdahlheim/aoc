defmodule Aoc.Aoc2024.Day6Test do
  use ExUnit.Case
  alias Aoc.Aoc2024.Day6
  doctest Aoc.Aoc2024.Day6

  test "aoc day6 part1" do
    assert 5318 ==
             "./test/aoc2024/input/day6.txt"
             |> File.read!()
             |> Day6.part_1()
             |> IO.inspect(label: :part1)
  end

  test("aoc day6 part2") do
    assert 1831 ==
             "./test/aoc2024/input/day6.txt"
             |> File.read!()
             |> Day6.part_2()
             |> IO.inspect(label: :part2)
  end
end
