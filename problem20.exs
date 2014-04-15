defmodule Problem20 do

  def n!(0, acc) do
    x = Enum.reduce(acc, fn(x, acc) -> x * acc end)
    y = :lists.concat([x]) |> String.split(~r{}, trim: true) |> List.delete []
    Enum.map(y, fn(x) -> list_to_integer(x) end) |> :lists.sum
  end

  def n!(n, acc \\ []) do
    n!(n - 1, acc ++ [n])
  end
end

IO.inspect Problem20.n! 100
