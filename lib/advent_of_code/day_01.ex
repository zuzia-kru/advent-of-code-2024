defmodule AdventOfCode.Day01 do
  def part1(args) do
    args
    |> String.split("\n")
    |> Enum.reject(fn l -> l == "" end)
    |> Enum.map(fn line -> String.split(line) end)
    |> Enum.map(fn chars -> Enum.map(chars, &String.to_integer/1) end)
    |> Enum.map(fn numbers -> {List.first(numbers), List.last(numbers)} end)
    |> Enum.unzip()
    |> sort_lists()
    |> Enum.zip_reduce(0, fn [num1, num2], acc -> max(num1, num2) - min(num1, num2) + acc end)
  end

  defp sort_lists({list1, list2}) do
    [Enum.sort(list1), Enum.sort(list2)]
  end

  def part2(args) do
    args
    |> String.split("\n")
    |> Enum.reject(fn l -> l == "" end)
    |> Enum.map(fn line -> String.split(line) end)
    |> Enum.map(fn chars -> Enum.map(chars, &String.to_integer/1) end)
    |> Enum.map(fn numbers -> {List.first(numbers), List.last(numbers)} end)
    |> Enum.unzip()
    |> similarity_score()
  end

  defp similarity_score({left, right}) do
    frequencies = Enum.frequencies(right)
    Enum.reduce(left, 0, fn n, acc -> n * Map.get(frequencies, n, 0) + acc end)
  end
end
