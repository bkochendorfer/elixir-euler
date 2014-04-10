defmodule Problem10 do
  @doc "
  The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

  Find the sum of all the primes below two million.
  "

  def prime?(2), do: true

  def prime?(n) do
    prime_check(n, :math.sqrt(n) |> :erlang.trunc)
  end

  def prime_check(_, 1), do: true
  def prime_check(number, srqt_floor) do
    if rem(number, srqt_floor) == 0 do
      false
    else
      prime_check(number, srqt_floor - 1)
    end
  end

  def sum([], total), do: total
  def sum([head|tail], total \\ 0), do: sum(tail, head + total)

  def prime_sum(n \\ 2, primes \\ []) do
    IO.inspect List.last(primes)
    cond do
      prime?(n) ->
        prime_sum(n + 1, primes ++ [n])
      n > 2_000_000 ->
        sum(primes)
      true ->
        prime_sum(n + 1, primes)
    end
  end
end

IO.inspect Problem10.prime_sum
