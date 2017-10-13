defmodule TILEX.Behaviours do
  defmodule Greet do
    @moduledoc """
    Defines a behaviour to greet people hello and goodbye in different languages.

    Behaviours provide a way to:
    - define a set of functions that have to be implemented by a module;
    - ensure that a module implements all the functions in that set.

    Many modules share the same public API. For example: Each plug is a module 
    which has to implement at least two public functions: init/1 and call/2.
    """
    @callback say_hello(name :: String.t) :: nil
    @callback say_bye(name :: String.t) :: nil

    @doc """
    Dynamic dispatching of say_hello/1.

    ## Examples
        iex> alias TILEX.Behaviours.Greet
        iex> Greet.dispatch_say_hello(TILEX.Behaviours.SpanishGreet, "Rob")
        "Hola Rob"
        
        iex> alias TILEX.Behaviours.Greet
        iex> Greet.dispatch_say_hello(TILEX.Behaviours.EnglishGreet, "Rob")
        "Hello Rob"
    """
    def dispatch_say_hello(implementation, name) do
      implementation.say_hello(name)
    end
  end

  defmodule EnglishGreet do
    @moduledoc """
    Implementation of the Greet behaviour for the English language.
    """
    @behaviour Greet

    @doc """
    Greets to `name` in English.
      
    ## Examples
        iex> TILEX.Behaviours.EnglishGreet.say_hello("Rafa")
        "Hello Rafa"
    """
    def say_hello(name), do: "Hello " <> name

    @doc """
    Goodbyes to `name` in English.
    
    ## Examples
        iex> TILEX.Behaviours.EnglishGreet.say_bye("Rafa")
        "Goodbye Rafa"
    """
    def say_bye(name), do: "Goodbye " <> name
  end
  
  defmodule SpanishGreet do
    @moduledoc """
    Implementation of the Greet behaviour for the Spanish language.
    """
    @behaviour Greet

    @doc """
    Greets to `name` in Spanish.
    
    ## Examples
        iex> TILEX.Behaviours.SpanishGreet.say_hello("Rafa")
        "Hola Rafa"
    """    
    def say_hello(name), do: "Hola " <> name

    @doc """
    Goodbyes to `name` in Spanish.
    
    ## Examples
        iex> TILEX.Behaviours.SpanishGreet.say_bye("Rafa")
        "Adios Rafa"
    """
    def say_bye(name), do: "Adios " <> name
  end
end
