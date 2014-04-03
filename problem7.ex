defmodule Problem7 do
  @doc """
  By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
  that the 6th prime is 13.

  What is the 10 001st prime number?
  """

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

  def prime_gen(_, primes) when length(primes) == 10_001 do
      IO.inspect primes |> List.last
  end

  def prime_gen(n \\ 2, primes \\ []) do
    cond do
      prime?(n) ->
        prime_gen(n + 1, primes ++ [n])
      true ->
        prime_gen(n + 1, primes)
    end
  end
end

Problem7.prime_gen
