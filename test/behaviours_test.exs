defmodule TILEX.BehavioursTest do
  use ExUnit.Case, async: true
  doctest TILEX.Behaviours.EnglishGreet
  doctest TILEX.Behaviours.SpanishGreet  
  doctest TILEX.Behaviours.Greet  

  alias TILEX.Behaviours.{EnglishGreet, SpanishGreet, Greet}

  describe "EnglishGreet" do
    test "says hello in English" do
      assert EnglishGreet.say_hello("Peter") == "Hello Peter"
    end

    test "says goodbye in English" do
      assert EnglishGreet.say_bye("Peter") == "Goodbye Peter"
    end
  end

  describe "SpanishGreet" do
    test "says hello in Spanish" do
      assert SpanishGreet.say_hello("Peter") == "Hola Peter"
    end

    test "says goodbye in Spanish" do
      assert SpanishGreet.say_bye("Peter") == "Adios Peter"
    end
  end

  describe "Greet.dispatch_say_hello/2" do
    test "dispatches dynamically to the passed in implementation" do
      assert Greet.dispatch_say_hello(SpanishGreet, "Tim") == "Hola Tim"
      assert Greet.dispatch_say_hello(EnglishGreet, "Tim") == "Hello Tim"      
    end
  end
end
