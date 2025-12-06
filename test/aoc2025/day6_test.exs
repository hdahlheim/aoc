defmodule Aoc2025.Day6Test do
  use ExUnit.Case

  alias Aoc2025.Day6
  doctest Aoc2025.Day6

  @test_input File.read!(Path.expand("./test/aoc2025/input/day6.txt"))

  test "part 1" do
    assert 6_605_396_225_322 == Day6.part_1(@test_input)
  end

  test "part 2" do
    assert 11_052_310_600_986 == Day6.part_2(@test_input)
  end
end
