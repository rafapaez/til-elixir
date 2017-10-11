defmodule TILEX.WhileLoop do
  @moduledoc """
  This module provides macros to perform loop iterations.
  """

  @doc """
  The `while/2` macro loops as long as the `condition` is thuthy".
  """
  defmacro while(condition, do: block) do
    quote do
      try do  
        for _ <- Stream.cycle([:_]) do
          if unquote(condition) do
            unquote(block)
          else
            break()
          end
        end
      catch
        :break -> :ok
      end
    end
  end

  @doc """
  The `break/0` macro terminates the execution of a `while/2` macro".
  """
  def break(), do: throw :break  
end
