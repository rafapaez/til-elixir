defmodule TILEX.IfMacroTest do
  use ExUnit.Case, async: true
  doctest TILEX.IfMacro

  alias TILEX.IfMacro

  describe "IfMacro.my_if/2" do
    test "return the if block when condition is met" do
      assert IfMacro.my_if(return_bool(true), do: :ok, else: :ko) == :ok
    end

    test "return the else block when condition is not met" do
      assert IfMacro.my_if(return_bool(false), do: :ok, else: :ko) == :ko
    end
  end

  # Func to avoid "warning: this check/guard will always yield the same result"
  defp return_bool(bool), do: bool
end
