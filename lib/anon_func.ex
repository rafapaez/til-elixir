defmodule TILEX.AnonFunc do
  @moduledoc """
  Having fun with anonymous functions in Elixir.
  """

  @doc ~S"""
  Runs the anonymous function passed as argument.

  ## Examples
      iex> sum = fn(a, b) -> a + b end
      iex> TILEX.AnonFunc.run_operation(2, 3, sum)
      5

      iex> mult = &(&1 * &2) # shorthand syntax
      iex> TILEX.AnonFunc.run_operation(2, 3, mult)
      6
  """
  def run_operation(a, b, operation) do
    operation.(a, b)
  end

  @doc ~S"""
  Can be split into multiple clauses using pattern matching.

  ## Examples
      iex> TILEX.AnonFunc.run_transaction(100, 25, :deposit)
      125

      iex> TILEX.AnonFunc.run_transaction(100, 25, :withdrawal)
      75

      iex> TILEX.AnonFunc.run_transaction(100, 25, :nop)
      :wrong_operation
  """
  def run_transaction(a, b, operation) do
    account_transaction = fn
      (balance, amount, :deposit) -> balance + amount
      (balance, amount, :withdrawal) -> balance - amount
      (_balance, _amount, _) -> :wrong_operation
    end
    
    # note: anonymous function wrapped for doc testing purposes
    account_transaction.(a, b, operation)
  end
end