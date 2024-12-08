defmodule Aoc do
  @moduledoc """
  Documentation for `Aoc`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Aoc.hello()
      :world

  """
  def hello do
    :world
  end

  def get_input(path) do
    res =
      Req.get!("https://adventofcode.com/" <> path <> "/input", headers: %{cookie: get_cookie()})

    res.body
  end

  defp get_cookie() do
    (File.cwd!() <> "/" <> Path.relative_to_cwd("./.aoc-cookie"))
    |> File.read!()
    |> String.trim()
  end
end
