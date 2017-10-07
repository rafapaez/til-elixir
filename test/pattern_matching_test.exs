defmodule TILEX.PatternMatchingTest do
  use ExUnit.Case, async: true
  doctest TILEX.PatternMatching
  
  import TILEX.PatternMatching

  test "say_hello/1 matches on User structs" do
    user = %TILEX.PatternMatching.User{name: "Rafa", age: 21}
    assert say_hello(user) == "Hi Rafa! You're 21 years old."
  end

  test "say_hello/1 raises FunctionClauseError when does not match a User" do
    assert_raise FunctionClauseError, fn -> say_hello(:ups) end
  end

  test "get_postcode/1 matches on a nested map field" do
    user_map = %{name: "Pep", age: 24, address: %{street: "SW", postcode: "S16"}}
    assert get_postcode(user_map) == "S16"
  end

  test "get_postcode/1 returns :not_found when the map does have the postcode" do
    user_map_without_postcode = %{name: "Raf", age: 18, address: %{street: "ST"}}
    assert get_postcode(user_map_without_postcode) == :not_found
  end

  test "greet/2 matches using the pin operator" do
    assert greet("Hello", "Bob") == "Hi Bob!"
  end
end