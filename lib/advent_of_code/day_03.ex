defmodule AdventOfCode.Day03 do
  def part1(args) do
    ~r/mul\(\d{1,3},\d{1,3}\)/
    |> Regex.scan(args)
    |> Enum.map(fn [command] -> do_multiply(command) end)
    |> Enum.sum()
  end

  defp do_multiply(command) do
    ~r/\d{1,3}/
    |> Regex.scan(command)
    |> Enum.map(fn [x] -> String.to_integer(x) end)
    |> Enum.product()
  end

  def part2(args) do
    ~r/(mul\(\d{1,3},\d{1,3}\))|(do\(\))|(don\'t\(\))/
    |> Regex.scan(args)
    |> Enum.map_reduce(1, &maybe_multiply(&1, &2))
    |> elem(0)
    |> Enum.sum()
  end

  defp maybe_multiply([command | _other_matches], enabler) do
    case command do
      "do()" -> {0, 1}
      "don't()" -> {0, 0}
      _ -> {do_multiply(command) * enabler, enabler}
    end
  end
end
