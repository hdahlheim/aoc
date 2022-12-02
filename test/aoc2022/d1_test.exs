defmodule Aoc.Aoc2022.D1Test do
  use ExUnit.Case
  alias Aoc.Aoc2022.D1
  doctest Aoc.Aoc2022.D1

  test "part 1" do
    "./test/aoc2022/input/d1.txt"
    |> File.read!()
    |> D1.part_1()
    |> IO.inspect()
  end

  test "part 2" do
    "./test/aoc2022/input/d1.txt"
    |> File.read!()
    |> D1.part_2()
    |> IO.inspect()
  end
end
