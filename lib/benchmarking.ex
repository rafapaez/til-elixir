defmodule TILEX.Benchmarking do
  @moduledoc """
  Understanding how to benchmark in Elixir with Beenchee: 
  A library for easy and nice (micro) benchmarking in Elixir
  """

  @doc ~S"""
  Returns the count of `str_char` items in the given `string`.
  It uses a Regular Expression (`Regex.scan/3`) as the main algorithm. 

  ## Examples
      iex> "Erlang is robust. Phoenix is productive. Elixir is love."
      ...> |> TILEX.Benchmarking.regex_count(".")
      3
  """
  def regex_count(string, str_char) do
    ~r"[#{str_char}]" |> Regex.scan(string) |> Enum.count()
  end

  @doc ~S"""
  Returns the count of `str_char` items in the given `string`.
  It splits in graphemes and uses `Enun.count/2` as the main algorithm. 

  ## Examples
      iex> "Erlang is robust. Phoenix is productive. Elixir is love."
      ...> |> TILEX.Benchmarking.enum_count(".")
      3
  """
  def enum_count(string, str_char) do
    string |> String.graphemes() |> Enum.count(&(&1 == str_char))
  end

  @doc ~S"""
  Returns the count of `str_char` items in the given `string`.
  It uses `String.split/2` as the main algorithm and then counts. 

  ## Examples
      iex> "Erlang is robust. Phoenix is productive. Elixir is love."
      ...> |> TILEX.Benchmarking.split_count(".")
      3
  """
  def split_count(string, str_char) do
    string |> String.split(str_char) |> Enum.count() |> Kernel.-(1)
  end

  @doc ~S"""
  Runs the benchmarks against the above 3 different functions, printing
  and returning lots of statistics as shown below.

  ## Usage & Output

    (1)> TILEX.Benchmarking.run_benchmarks(1_000)

    Name                  ips        average  deviation         median
    split_count      156.63 K        6.38 μs   ±136.96%        6.00 μs
    regex_count       56.28 K       17.77 μs    ±46.84%       17.00 μs
    enum_count         6.36 K      157.32 μs    ±18.35%      143.00 μs

    Comparison:
    split_count      156.63 K
    regex_count       56.28 K - 2.78x slower
    enum_count         6.36 K - 24.64x slower


    (2)> TILEX.Benchmarking.run_benchmarks(1_000_000)

    Name                  ips        average  deviation         median
    split_count        102.11        9.79 ms     ±7.32%        9.71 ms
    regex_count         56.26       17.77 ms    ±10.93%       17.18 ms
    enum_count           3.75      266.40 ms    ±20.59%      239.21 ms

    Comparison:
    split_count        102.11
    regex_count         56.26 - 1.81x slower
    enum_count           3.75 - 27.20x slower

  """
  def run_benchmarks(length \\ 100) do
    string   = generate_random_string(length)
    str_char = generate_random_string(1)
    
    Benchee.run(%{
      regex_count: fn -> regex_count(string, str_char) end,
      enum_count:  fn -> enum_count(string, str_char)  end,
      split_count: fn -> split_count(string, str_char) end
    })
  end

  defp generate_random_string(length) do
    length
    |> :crypto.strong_rand_bytes()
    |> Base.url_encode64()
    |> binary_part(0, length)
  end
end
