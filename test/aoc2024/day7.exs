defmodule Aoc.Aoc2024.Day7Test do
  use ExUnit.Case
  alias Aoc.Aoc2024.Day7
  doctest Aoc.Aoc2024.Day7

  @test_input AocTest.get_input("2024/day/7")

  test "aoc day7 part1" do
    assert 945_512_582_195 ==
             @test_input
             |> Day7.part_1()
             |> IO.inspect(label: :part1)
  end

  test("aoc day7 part2") do
    assert 271_691_107_779_347 ==
             @test_input
             |> Day7.part_2()
             |> IO.inspect(label: :part2)
  end
end
