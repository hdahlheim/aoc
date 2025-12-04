defmodule Aoc2025.Day3Test do
  use ExUnit.Case

  alias Aoc2025.Day3
  doctest Aoc2025.Day3

  @test_input File.read!(Path.expand("./test/aoc2025/input/day3.txt"))

  test "part 1" do
    assert 17408 == Day3.part_1(@test_input)
  end

  test "part 2" do
    assert 172_740_584_266_849 == Day3.part_2(@test_input)
  end
end
