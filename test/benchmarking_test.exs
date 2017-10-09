defmodule TILEX.BenchmarkingTest do
  use ExUnit.Case, async: true
  doctest TILEX.Benchmarking

  import TILEX.Benchmarking

  setup_all do
    [text: "Hey there! I'm Rafa and I love Elixir."]
  end

  test "regex_count/2 counts single string chars", context do
    assert regex_count(context[:text], "a") == 3
  end

  test "enum_count/2 counts single string chars", context do
    assert enum_count(context[:text], "a") == 3
  end

  test "split_count/2 counts single string chars", context do
    assert split_count(context[:text], "a") == 3
  end
end
