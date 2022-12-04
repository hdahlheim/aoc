defmodule Aoc.Aoc2020.D1Test do
  use ExUnit.Case
  alias Aoc.Aoc2020.D1
  doctest Aoc.Aoc2020.D1

  test "part 1" do
    "./test/aoc2020/input/d1.txt"
    |> File.read!()
    |> D1.part_1()
    |> IO.inspect(label: :part_1)
  end

  test "part 2" do
    "./test/aoc2020/input/d1.txt"
    |> File.read!()
    |> D1.part_2()
    |> IO.inspect(label: :part_2)
  end
end
