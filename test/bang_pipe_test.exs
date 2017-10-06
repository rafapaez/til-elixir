defmodule TILEX.BangPipeTest do
  use ExUnit.Case, async: true
  doctest TILEX.BangPipe

  import TILEX.BangPipe

  test "pipes with {:ok, _} tuples" do
    assert {:ok, [:phoenix, :ecto, :plug]} <|> length() == 3
  end

  test "pipes without {:ok, _} tuples" do
    assert [:phoenix, :ecto, :plug] <|> length() == 3
  end
end