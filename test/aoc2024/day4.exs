defmodule Aoc.Aoc2024.Day4Test do
  use ExUnit.Case
  alias Aoc.Aoc2024.Day4
  doctest Aoc.Aoc2024.Day4

  test "aoc day4 part1" do
    assert 2718 ==
             "./test/aoc2024/input/day4.txt"
             |> File.read!()
             |> Day4.part_1()
             |> IO.inspect(label: :part1)
  end

  test "aoc day4 part2" do
    assert 2046 ==
             "./test/aoc2024/input/day4.txt"
             |> File.read!()
             |> Day4.part_2()
             |> IO.inspect(label: :part2)
  end
end
