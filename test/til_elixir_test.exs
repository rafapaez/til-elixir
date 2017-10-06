defmodule TILEXTest do
  use ExUnit.Case
  doctest TILEX

  test "greets the world" do
    assert TILEX.hello() == :world
  end
end
