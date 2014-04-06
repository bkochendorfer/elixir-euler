defmodule Problem4 do

  @doc "
  A palindromic number reads the same both ways. The largest palindrome made
  from the product of two 2-digit numbers is 9009 = 91 × 99.

  Find the largest palindrome made from the product of two 3-digit numbers.
  "

  def pal([_], max), do: max
  def pal([ head | tail ], max \\ 0) do
    new_max = Enum.map(tail, &func(&1,head)) |> Enum.max
    cond do
      new_max > max ->
        pal(tail, new_max)
      true ->
        pal(tail, max)
    end
  end

  def func(x,head) do
    if to_string(x * head) == String.reverse(to_string(x * head)) do
      test
    else
      0
    end
  end
end

IO.inspect Problem4.pal(100..999 |> Enum.uniq)
