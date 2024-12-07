defmodule Aoc.Aoc2024.Day7Test do
  use ExUnit.Case
  alias Aoc.Aoc2024.Day7
  doctest Aoc.Aoc2024.Day7

  @tag :skip
  test "aoc day7 part1" do
    assert 945_512_582_195 ==
             "./test/aoc2024/input/day7.txt"
             |> File.read!()
             |> Day7.part_1()
             |> IO.inspect(label: :part1)
  end

  @tag :skip
  test("aoc day7 part2") do
    assert 0 ==
             "./test/aoc2024/input/day7.txt"
             |> File.read!()
             |> Day7.part_2()
             |> IO.inspect(label: :part2)
  end
end
