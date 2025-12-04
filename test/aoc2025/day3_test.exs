defmodule Aoc2025.Day3Test do
  use ExUnit.Case

  alias Aoc2025.Day3
  doctest Aoc2025.Day3

  @test_input File.read!(Path.expand("./test/aoc2025/input/day3.txt"))

  test "part 1" do
    assert 17408 == Day3.part_1(@test_input)
  end
end
