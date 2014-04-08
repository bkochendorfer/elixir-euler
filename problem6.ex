defmodule Problem6 do

  def mapsum([], _fun, return), do: sum(return, 0)
  def mapsum( [ head | tail ], fun, return \\ [] ) do
    mapsum(tail, fun, return ++ [fun.(head)])
  end

  def sum([], total), do: total
  def sum([head|tail], total), do: sum(tail, head + total)

  def square(n), do: n * n
end

x = 1..100 |> Enum.uniq |> Problem6.mapsum(fn(x) -> Problem6.square(x) end)
y = 1..100 |> Enum.uniq |> Problem6.sum(0) |> Problem6.square

IO.inspect y - x
