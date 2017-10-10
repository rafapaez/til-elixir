defmodule TILEX.IfMacro do
  @moduledoc """
  This module provides a custom implementation of the `if/2` macro.
  """

  @doc ~S"""
  This `my_if/2` macro expects the first argument to be a condition and 
  the second argument to be a keyword list or a block.

  ## One-liner example

      if(condition, do: :is_true)

  In the example above, `:is_true` will be returned if `condition` evaluates to
  `true` (i.e., it is neither `false` nor `nil`). Otherwise, `nil` will be
  returned.

  An `else` option can be given to specify the opposite:

      if(condition, do: :is_true, else: :is_not_true)
  
  ## Blocks example

  It's also possible to pass a block to the `my_if/2` macro. The first
  example above would be translated to:

      if condition do
        :is_true
      end
  
  Note that `do/end` become delimiters. The second example would
  translate to:

      if condition do
        :is_true
      else
        :is_not_true
      end
  """
  defmacro my_if(condition, do: if_block) do
    quote do
      if(unquote(condition), do: unquote(if_block), else: nil)
    end
  end
  defmacro my_if(condition, do: if_block, else: else_block) do
    quote do
      case unquote(condition) do
        result when result in [false, nil] -> unquote(else_block)
        _ -> unquote(if_block)
      end
    end
  end
end
