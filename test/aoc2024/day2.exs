defmodule Aoc.Aoc2024.Day2Test do
  use ExUnit.Case
  alias Aoc.Aoc2024.Day2
  doctest Aoc.Aoc2024.Day2

  test "aoc day2 part1" do
    assert 314 ==
             "./test/aoc2024/input/day2.txt"
             |> File.read!()
             |> Day2.part_1()
             |> IO.inspect(label: :part1)
  end

  test "aoc day2 part2" do
    assert 373 ==
             "./test/aoc2024/input/day2.txt"
             |> File.read!()
             |> Day2.part_2()
             |> IO.inspect(label: :part2)
  end
end
