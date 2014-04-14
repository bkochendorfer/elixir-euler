defmodule Problem14 do

  def colatz(n, acc \\ []) do
    cond do
      rem(trunc(n),2) == 0 ->
        colatz(n / 2, acc ++ [n])
      n == 1 ->
        acc ++ [1]
      true ->
        colatz(3 * n + 1, acc ++ [n])
    end
  end
end


IO.inspect Enum.map(1..1_000_000, fn(x) -> Problem14.colatz(x) end)
|> Enum.max_by(fn(x) -> length x end)
|> List.first
