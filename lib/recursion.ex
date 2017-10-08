defmodule TILEX.Recursion do
  @moduledoc """
  Module to understand Recursion in Elixir.
  
  Recursive functions are functions that perform operations and then 
  invoke themselves until a condition is reached that stops the recursive 
  action from continuing. No data is mutated in this process. In fact, 
  mutating is not possible in Elixir.
  """

  @doc ~S"""
  Iterate through elements from a list printing them on the standard output.
  This iteration (aka "loop") is achieved using the cons operator `|`, 
  pattern matching and recursion.

  Since the following functions prints to standard output, doctest will not try 
  to capture the output. Thus doctest examples cannot be used here. 
  Check instead their test cases that are located in /test/recursion.test.exs
  """
  # recursive case
  def print_list([head | tail]) do
    IO.puts head
    print_list(tail)
  end
  # terminating scenario
  def print_list([]) do
  end

  @doc ~S"""
  Given a list of integers, returns a list with their perfect squares

  ## Examples
      iex> TILEX.Recursion.square_each([1, 2, 3, 4, 5])
      [1, 4, 9, 16, 25]
  """
  def square_each([head | tail]) do
    [head * head | square_each(tail)]
  end
  def square_each([]) do
    []
  end

  @doc ~S"""
  Returns the factorial of a number (Tail Recursive Factorial)

  ## Examples
      iex> TILEX.Recursion.factorial(5)
      120  # 5! = 5 * 4 * 3 * 2
  """
  def factorial(n), do: factorial(n, 1)
  defp factorial(1, acc), do: acc
  defp factorial(n, acc), do: factorial(n - 1, acc * n)

  @doc ~S"""
  Returns the first `n` Fibonacci numbers

  ## Examples
      iex> TILEX.Recursion.fib_seq(10)
      [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
  """
  def fib_seq(n) when is_integer(n) and n > 0 do
    Enum.map(0..n-1, &fib_n(&1))
  end

  defp fib_n(n, current \\ 0, next \\ 1)  
  defp fib_n(0, current, _next), do: current
  defp fib_n(n, current, next), do: fib_n(n - 1, next, current + next)
end