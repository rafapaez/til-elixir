defmodule TILEX.PatternMatching do
  @moduledoc """
  Showing pattern matching in functions definitions.
  """

  defmodule User do
    @enforce_keys [:name] # mandatory field!
    defstruct [:name, :age, :address]
  end

  @doc ~S"""
  Matches on Structs

  ## Examples
      iex> alias TILEX.PatternMatching.User
      iex> tim = %User{name: "Tim", age: 18}
      iex> TILEX.PatternMatching.say_hello(tim)
      "Hi Tim! You're 18 years old."

      iex> alias TILEX.PatternMatching.User
      iex> sam = %User{name: "Sam", age: nil}
      iex> TILEX.PatternMatching.say_hello(sam)
      "Hi Sam! Sorry, I don't know your age."
  """
  def say_hello(%TILEX.PatternMatching.User{name: name, age: nil}) do
    "Hi #{name}! Sorry, I don't know your age."
  end
  def say_hello(%TILEX.PatternMatching.User{name: name, age: age}) do 
    "Hi #{name}! You're #{age} years old."
  end

  @doc ~S"""
  Matches on Maps and against the contents of variables  

  ## Examples
      iex> user_map = %{name: "Raf", age: 18, address: %{street: "ST", postcode: "E14"}}
      iex> TILEX.PatternMatching.get_postcode(user_map)
      "E14"
  """
  def get_postcode(%{address: %{postcode: postcode}}), do: postcode
  def get_postcode(_), do: :not_found

  @doc ~S"""
  Matches on function clauses using the pin `^` operator

  ## Examples
      iex> TILEX.PatternMatching.greet("Hello", "Rafa")
      "Hi Rafa!"

      iex> TILEX.PatternMatching.greet("Morning", "Rafa")
      "Morning Rafa!"
  """
  def greet(greeting, name) do
    default = "Hello"
    greet = fn
      (^default, name) -> "Hi #{name}!"
      (default, name) -> "#{default} #{name}!"
    end
    # note: anonymous function wrapped into a named one for testing purposes
    greet.(greeting, name)
  end
end