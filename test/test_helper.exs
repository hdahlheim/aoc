ExUnit.start()

defmodule AocTest do
  defdelegate get_input(path), to: Aoc
end
