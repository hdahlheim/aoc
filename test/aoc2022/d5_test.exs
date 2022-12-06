defmodule Aoc.Aoc2022.D5Test do
  use ExUnit.Case
  alias Aoc.Aoc2022.D5
  doctest Aoc.Aoc2022.D5

  test "part 1" do
    res =
      "./test/aoc2022/input/d5.txt"
      |> File.read!()
      |> D5.part_1()
      |> IO.inspect(label: :part_1)

    assert "FWSHSPJWM" == res
  end

  test "part 2" do
    res =
      "./test/aoc2022/input/d5.txt"
      |> File.read!()
      |> D5.part_2()
      |> IO.inspect(label: :part_2)

    assert "PWPWHGFZS" = res
  end
end
