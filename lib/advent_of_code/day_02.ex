defmodule AdventOfCode.Day02 do
  def part1(args) do
    args
    |> String.split("\n")
    |> Enum.reject(fn l -> l == "" end)
    |> Enum.map(fn line -> String.split(line) end)
    |> Enum.map(fn chars -> Enum.map(chars, &String.to_integer/1) end)
    |> Enum.map(fn report -> safe?(report) end)
    |> Enum.sum()
  end

  defp safe?([head | tail]) do
    recursive_safe?(head, tail, 0)
  end

  defp recursive_safe?(_head, [], _), do: 1

  defp recursive_safe?(head, [next | tail], diff) do
    if (next - head) * diff < 0 or next - head > 3 or next - head < -3 or next == head do
      0
    else
      recursive_safe?(next, tail, next - head)
    end
  end

  def part2(args) do
    args
    |> String.split("\n")
    |> Enum.reject(fn l -> l == "" end)
    |> Enum.map(fn line -> String.split(line) end)
    |> Enum.map(fn chars -> Enum.map(chars, &String.to_integer/1) end)
    |> Enum.map(fn report -> relaxed_safe?(report) end)
    |> Enum.sum()
  end

  defp relaxed_safe?([head | tail] = report) do
    case safe?(report) do
      1 -> 1
      0 -> safe_removing_level?([], head, tail)
    end
  end

  defp safe_removing_level?(start, _, []), do: safe?(start)

  defp safe_removing_level?(start, elem, [finhead | fintail] = finish) do
    case safe?(start ++ finish) do
      1 -> 1
      0 -> safe_removing_level?(start ++ [elem], finhead, fintail)
    end
  end
end
