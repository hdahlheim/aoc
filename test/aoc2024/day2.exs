defmodule Aoc.Aoc2024.Day2Test do
  use ExUnit.Case
  alias Aoc.Aoc2024.Day2
  doctest Aoc.Aoc2024.Day2

  @test_input AocTest.get_input("2024/day/2")

  test "aoc day2 part1" do
    assert 314 ==
             @test_input
             |> Day2.part_1()
             |> IO.inspect(label: :part1)
  end

  test "aoc day2 part2" do
    assert 373 ==
             @test_input
             |> Day2.part_2()
             |> IO.inspect(label: :part2)
  end
end
