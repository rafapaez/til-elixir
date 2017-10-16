defmodule TILEX.Protocols do
  @moduledoc """
  This module defines a custom protocol.

  Protocols are a mechanism to achieve polymorphism in Elixir. 
  Dispatching on a protocol is available to any data type 
  as long as it implements the protocol.
  """

  defprotocol Blank do
    # All data types (including structs) that we have not implemented the 
    # Blank protocol for will be considered non-blank (*)
    @fallback_to_any true 

    @doc """
    Returns `true` if `data` is considered blank/empty. 
    Otherwise returns `false`.

    ## Examples

        iex> TILEX.Protocols.Blank.blank?(0)
        false

        iex> TILEX.Protocols.Blank.blank?([])
        true

        iex> TILEX.Protocols.Blank.blank?([1, 2])
        false

        iex> TILEX.Protocols.Blank.blank?(%{})
        true

        iex> TILEX.Protocols.Blank.blank?(%{a: 1})
        false

        iex> TILEX.Protocols.Blank.blank?(%TILEX.Protocols.User{name: nil, age: nil})
        true

        iex> TILEX.Protocols.Blank.blank?(%TILEX.Protocols.User{name: "Pep", age: 33})
        false

        iex> TILEX.Protocols.Blank.blank?({}) # for tuples hasn't been implemented!
        false
    """
    def blank?(data)
  end

  defimpl Blank, for: Integer do
    # Integers never are blank
    def blank?(_), do: false
  end

  defimpl Blank, for: Any do
    # Default implementation for all type.
    # Setting `@fallback_to_any` to `true` in the protocol definition. (*)
    def blank?(_), do: false
  end

  defimpl Blank, for: List do
    def blank?([]), do: true
    def blank?(_),  do: false
  end

  defimpl Blank, for: Map do
    # Cannot pattern match on %{} because it matches on all maps.
    def blank?(map), do: map_size(map) == 0
  end

  defimpl Blank, for: Atom do
    def blank?(false), do: true
    def blank?(nil),   do: true
    def blank?(_),     do: false
  end

  defmodule User do
    defstruct name: "Rafa", age: 21
  end

  defimpl Blank, for: User do
    def blank?(%User{name: nil, age: nil}), do: true    
    def blank?(_), do: false
  end  
end
