defmodule Problem3 do

  @doc """
  The prime factors of 13195 are 5, 7, 13 and 29.

  What is the largest prime factor of the number 600851475143 ?
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

  def prime_factors(number, div \\ 2, factors \\ []) do
    cond do
      prime?(number) ->
        [number | factors]
      rem(number, div) == 0 ->
        prime_factors(div(number, div), 2, [div | factors])
      true ->
        prime_factors(number, div + 1, factors)
    end
  end

  def largest_prime(n), do: prime_factors(n) |> List.first

end

IO.inspect Problem3.largest_prime 600851475143