defmodule TILEX.WhileLoopTest do
  use ExUnit.Case, async: true
  
  import TILEX.WhileLoop

  describe "while/2" do
    test "loops as long as the condition is truthy" do
      pid = spawn(fn -> :timer.sleep(:infinity) end)
      
      send self(), :go
      while Process.alive?(pid) do
        receive do
          :go -> send self(), :next
          :next -> send self(), :final
          :final ->
            Process.exit(pid, :kill)
            send self(), :done
        end
      end
      assert_received :done
    end
  end

  describe "break/0" do
    test "terminates the while execution" do
      send self(), :go
      while true do
        receive do
          :go -> send self(), :next
          :next -> send self(), :final
          :final ->
            send self(), :done
            break()
        end
      end
      assert_received :done
    end
  end
end
