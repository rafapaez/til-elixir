defmodule TILEX.RecursionTest do
  use ExUnit.Case, async: true
  doctest TILEX.Recursion

  import TILEX.Recursion
  import ExUnit.CaptureIO # Functionality to capture IO for testing.

  test "print_list/1 works for a list of integers" do
    fun = fn -> print_list([1, 2, 3, 4, 5]) end
    assert capture_io(fun) == "1\n2\n3\n4\n5\n"
  end

  test "print_list/1 works for a list of strings" do
    fun = fn -> print_list(["Elixir", "Phoenix", "Ecto"]) end
    assert capture_io(fun) == "Elixir\nPhoenix\nEcto\n"
  end

  test "print_list/1 works for an empty list" do
    fun = fn -> print_list([]) end
    assert capture_io(fun) == ""
  end

  test "square_each/1 works as expected" do
    assert square_each([0, 1, 7, 11]) == [0, 1, 49, 121]
  end

  test "square_each/1 works for an empty list" do
    assert square_each([]) == []
  end

  test "factorial/2 works as expected" do
    assert factorial(6) == 720
  end

  test "fib_seq/1 return the Fibonacci sequence" do
    assert fib_seq(12) == [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]
  end
end