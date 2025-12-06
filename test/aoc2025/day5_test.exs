defmodule Aoc2025.Day5Test do
  use ExUnit.Case

  alias Aoc2025.Day5
  doctest Aoc2025.Day5

  @test_input File.read!(Path.expand("./test/aoc2025/input/day5.txt"))

  test "part 1" do
    assert 601 == Day5.part_1(@test_input)
  end

  test "part 2" do
    assert 367_899_984_917_516 = Day5.part_2(@test_input)
  end
end
