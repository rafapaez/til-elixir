defmodule Mix.Tasks.Tilex.Functions do
  use Mix.Task

  @shortdoc "Returns the functions defined for the given `module`"

  @moduledoc ~S"""
  This mix task lists out all the available functions for the given `module`.          

  #Usage
  ```
     mix tilex.functions TILEX.WhileLoop
  ```
  """

  def run([module]) do     
    Module.concat(Elixir, module)
    |> apply(:__info__, [:functions])
    |> inspect()
    |> Mix.shell.info()
  end
end

## Usage notes
#
# $ mix help | grep tilex
# mix tilex.functions   # Returns the functions defined in the given `module`
#
# $ mix help tilex.functions
#                               mix tilex.functions
# This is used to list out the all available functions in the module. You suppose
# to pass module_name as parameter to the task. #Usage
#        mix tilex.functions TILEX.WhileLoop
# Location: _build/dev/lib/til_elixir/ebin
#
# $ mix tilex.functions TILEX.Recursion
# [factorial: 1, fib_seq: 1, print_list: 1, square_each: 1]
#
# $ mix tilex.functions TILEX.PatternMatching
# [get_postcode: 1, greet: 2, say_hello: 1]
