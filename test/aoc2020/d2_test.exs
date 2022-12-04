defmodule Aoc.Aoc2020.D2Test do
  use ExUnit.Case
  alias Aoc.Aoc2020.D2
  doctest Aoc.Aoc2020.D2

  test "part 1" do
    "./test/aoc2020/input/d2.txt"
    |> File.read!()
    |> D2.part_1()
    |> IO.inspect(label: :part_1)
  end

  test "part 2" do
    "./test/aoc2020/input/d2.txt"
    |> File.read!()
    |> D2.part_2()
    |> IO.inspect(label: :part_2)
  end
end
