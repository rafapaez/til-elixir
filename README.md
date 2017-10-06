# TIL Elixir

> Today I Learned in Elixir

A collection of didactic and fun Elixir code fragments I learn day to day.

## Installation

Install [Elixir](https://elixir-lang.org/install.html), if you haven't already.

Next, follow these setup steps:

```
$ git clone https://github.com/rafapaez/til-elixir
$ cd til_elixir
$ mix deps.get
```

## Usage

Open Elixir's Interactive Shell (IEx) with:

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

## Testing

Run the tests with:

```
$ mix test
```

## License

&copy; 2017 Rafa Paez

This repository is licensed under the MIT license.

