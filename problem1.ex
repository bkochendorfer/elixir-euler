defmodule Problem1 do
  @doc """
  If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

  Find the sum of all the multiples of 3 or 5 below 1000.
  iex |> Problem1.threefive 1..999
  """

  def of(num) when rem(num, 3) == 0 do
    num
  end

  def of(num) when rem(num, 5) == 0 do
    num
  end

  def of(_num), do: nil

  def threefive(range) do
    Enum.filter(range, &(of &1)) |> Enum.reduce &(&1 + &2)
  end

end

IO.puts Problem1.threefive 1..999