# Get Mix output sent to the current
# process to avoid polluting tests.
Mix.shell(Mix.Shell.Process)

defmodule Mix.Tasks.Tilex.FunctionsTest do
  use ExUnit.Case, async: true

  defmodule Greet do
    def hello(name), do: "Hello #{name}"
    def thanks(), do: "Thank you!" 
  end

  describe "run/1" do
    test "prints the functions of a Module" do
      Mix.Tasks.Tilex.Functions.run([Mix.Tasks.Tilex.FunctionsTest.Greet])

      assert_received {:mix_shell, :info, [functions]}
      assert functions ==  "[hello: 1, thanks: 0]"
    end
  end
end
