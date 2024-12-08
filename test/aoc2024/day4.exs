defmodule Aoc.Aoc2024.Day4Test do
  use ExUnit.Case
  alias Aoc.Aoc2024.Day4
  doctest Aoc.Aoc2024.Day4

  @test_input AocTest.get_input("2024/day/4")

  test "aoc day4 part1" do
    assert 2718 ==
             @test_input
             |> Day4.part_1()
             |> IO.inspect(label: :part1)
  end

  test "aoc day4 part2" do
    assert 2046 ==
             @test_input
             |> Day4.part_2()
             |> IO.inspect(label: :part2)
  end
end
