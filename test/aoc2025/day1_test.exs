defmodule Aoc2025.Day1Test do
  use ExUnit.Case

  alias Aoc2025.Day1
  doctest Aoc2025.Day1

  #
  @test_input File.read!(Path.expand("./test/aoc2025/input/day1.txt"))

  @tag :skip
  test "day 1 part 1" do
    assert 1195 === Day1.part_1(@test_input)
  end

  test "day 1 part 2" do
    assert 6 ===
             Day1.part_2("""
             L68
             L30
             R48
             L5
             R60
             L55
             L1
             L99
             R14
             L82
             """)

    assert 16 ===
             Day1.part_2("""
             L68
             L30
             R48
             L5
             R60
             L55
             L1
             L99
             R14
             L82
             L1000
             """)

    assert 36 ===
             Day1.part_2("""
             L68
             L30
             R48
             L5
             R60
             L55
             L1
             L99
             R14
             L82
             L1000
             L2000
             """)

    assert 1 ===
             Day1.part_2("""
             L50
             R50
             """)

    assert 11 ===
             Day1.part_2("""
             R1050
             """)

    assert 10 === Day1.part_2("L1000")
    assert 10 === Day1.part_2("R1000")
    assert 50 === Day1.part_2("R5000")
    assert 6951 !== Day1.part_2(@test_input)
    assert 6777 !== Day1.part_2(@test_input)
    assert 6446 !== Day1.part_2(@test_input)
    assert 6642 !== Day1.part_2(@test_input)
    assert 6770 === Day1.part_2(@test_input)
  end
end
