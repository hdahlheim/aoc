defmodule Aoc.Aoc2024.Day3Test do
  use ExUnit.Case
  alias Aoc.Aoc2024.Day3
  doctest Aoc.Aoc2024.Day3

  test "aoc day3 part1" do
    assert 174_960_292 ==
             "./test/aoc2024/input/day3.txt"
             |> File.read!()
             |> Day3.part_1()
             |> IO.inspect(label: :part1)
  end

  test "aoc day3 part2" do
    assert 56_275_602 ==
             "./test/aoc2024/input/day3.txt"
             |> File.read!()
             |> Day3.part_2()
             |> IO.inspect(label: :part2)
  end
end
