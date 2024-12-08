defmodule Aoc.Aoc2024.Day1Test do
  use ExUnit.Case
  alias Aoc.Aoc2024.Day1
  doctest Aoc.Aoc2024.Day1

  @test_input AocTest.get_input("2024/day/1")

  test "aoc day1 part1" do
    @test_input
    |> Day1.part_1()
    |> IO.inspect(label: :part1)
  end

  test "aoc day1 part2" do
    @test_input
    |> Day1.part_2()
    |> IO.inspect(label: :part2)
  end
end
