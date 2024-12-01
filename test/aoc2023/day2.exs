defmodule Aoc.Aoc2023.Day2Test do
  use ExUnit.Case
  alias Aoc.Aoc2023.Day2, as: Day
  doctest Day

  @input "./test/aoc2023/input/day2.txt"

  test "part 1" do
    assert 2685 ==
             @input
             |> File.read!()
             |> Day.part_1()
             |> IO.inspect(label: :part1)
  end

  # test "part 2" do
  #   @input
  #   |> File.read!()
  #   |> Day.part_2()
  #   |> IO.inspect(label: :part2)
  # end
end
