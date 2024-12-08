defmodule Aoc.Aoc2024.Day8Test do
  use ExUnit.Case
  alias Aoc.Aoc2024.Day8
  doctest Aoc.Aoc2024.Day8

  @test_input AocTest.get_input("2024/day/8")

  test "aoc day8 part1" do
    assert 303 ==
             @test_input
             |> Day8.part_1()
             |> IO.inspect(label: :part1)
  end

  test("aoc day8 part2") do
    assert 1045 ==
             @test_input
             |> Day8.part_2()
             |> IO.inspect(label: :part2)
  end
end
