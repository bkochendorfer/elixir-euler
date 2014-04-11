defmodule Problem12 do

  def factor_count(n) do
    sqrt = :math.sqrt(n)
    isqrt = :erlang.trunc sqrt
    cond do
      (sqrt = isqrt) ->
        factor_count(n, isqrt, 1, -1)
       true ->
         factor_count(n, isqrt, 1, 0)
    end
  end

  def factor_count(_n, isqrt, candidate, count) when candidate > isqrt do
     count
  end

  def factor_count(n, isqrt, candidate, count) do
    case rem(n,candidate) do
      0 ->
        factor_count(n, isqrt, candidate + 1, count + 2)
      _ ->
        factor_count(n, isqrt, candidate + 1, count)
    end
  end

  def next_triangle(index, triangle) do
    count = factor_count(triangle)
    if count > 500 do
      triangle
    else
      next_triangle(index + 1, triangle + index + 1)
    end
  end
end

IO.inspect Problem12.next_triangle(1,1)
