defmodule AdventOfCode.Day03 do
  def part1(args) do
    ~r/mul\(\d{1,3},\d{1,3}\)/
    |> Regex.scan(args)
    |> Enum.map(&do_multiply/1)
    |> Enum.sum()
  end

  defp do_multiply([command]) do
    ~r/\d{1,3}/
    |> Regex.scan(command)
    |> Enum.map(fn [x] -> String.to_integer(x) end)
    |> Enum.product()
  end

  def part2(_args) do
  end
end
