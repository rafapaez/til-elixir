# TIL Elixir

> Today I Learned in Elixir

A collection of didactic and fun Elixir code examples I learn day to day.


## Concepts

The lessons shared here cover the following Elixir and Functional Programming concepts:

* Elixir Basics
* Pattern Matching
* Immutability
* Modules and Functions
* Pipe Operator
* Control Flow
* Collections
* Enumerables and Streams
* Recursion
* Comprehensions
* Protocols
* Structs
* Polymorphism
* Behaviours
* Documentation
* Testing
* Mix
* Processes and Concurrency
* OTP
* Meta-programming
* Benchmarking


## Installation

Install [Elixir](https://elixir-lang.org/install.html), if you haven't already.

Next, follow these setup steps:

```
$ git clone https://github.com/rafapaez/til-elixir
$ cd til_elixir
$ mix deps.get
```


## Usage

Run Elixir's Interactive Shell (IEx) with:

```
$ iex -S mix
```

And start playing with the repo's code. For example:

```
iex(1)> import TILEX.BangPipe
TILEX.BangPipe

iex(2)> {:ok, ["Welcome", "to", "TIL", "Elixir!"]} <|> Enum.join(" ")
"Welcome to TIL Elixir!"
```

Check any module's documentation for more code samples.


## Testing

Run the tests with:

```
$ mix test
```

Note all modules and functions are tested using 
[Doctests](https://elixir-lang.org/getting-started/mix-otp/docs-tests-and-with.html#doctests) 
and [ExUnit](https://hexdocs.pm/ex_unit/ExUnit.html).


## License

&copy; 2017 Rafa Paez

This repository is licensed under the MIT license.

