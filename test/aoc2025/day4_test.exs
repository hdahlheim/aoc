defmodule Aoc2025.Day4Test do
  use ExUnit.Case

  alias Aoc2025.Day4
  doctest Aoc2025.Day4

  @test_input File.read!(Path.expand("./test/aoc2025/input/day4.txt"))

  test "part 1" do
    assert 1445 == Day4.part_1(@test_input)
  end

  test "part 2" do
    assert 8317 == Day4.part_2(@test_input)
  end
end
