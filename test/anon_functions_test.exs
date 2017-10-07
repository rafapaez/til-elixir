defmodule TILEX.AnonFunctionsTest do
  use ExUnit.Case, async: true
  doctest TILEX.AnonFunctions

  test "run_operation runs anonymous functions as arguments" do
    assert TILEX.AnonFunctions.run_operation(9, 7, &(&1 - &2)) == 2
  end

  test "run_transaction runs an anon function that uses pattern matching" do
    assert TILEX.AnonFunctions.run_transaction(1000, 200, :deposit) == 1_200
  end
end