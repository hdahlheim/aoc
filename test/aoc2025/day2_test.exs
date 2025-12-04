defmodule Aoc2025.Day2Test do
  use ExUnit.Case

  alias Aoc2025.Day2
  doctest Aoc2025.Day2

  @test_input File.read!(Path.expand("./test/aoc2025/input/day2.txt"))

  test "part 1" do
    assert 19_219_508_902 === Day2.part_1(String.trim(@test_input, "\n"))
  end

  test "part 2" do
    assert 27_180_728_081 === Day2.part_2(String.trim(@test_input, "\n"))
  end
end
