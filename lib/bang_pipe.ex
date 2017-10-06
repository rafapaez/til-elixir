defmodule TILEX.BangPipe do
  @moduledoc """
  Pipe between functions returning :ok tuples.
  """

  @doc ~S"""
  Operator to pipe between functions returning `{:ok, _}`

  ## Examples
      iex> import TILEX.BangPipe
      iex> {:ok, [1, 2, 3, 4, 5]} <|> Enum.max()
      5

      iex> import TILEX.BangPipe
      iex> Map.fetch(%{lang: "elixir"}, :lang) <|> String.capitalize()
      "Elixir"
  """
  defmacro (left <|> right) do
    quote do
      unquote(left)
      |> case do
        {:ok, value} -> value
        value -> value
      end
      |> unquote(right)
    end
  end
end