defmodule TILEX.ExternalResource.Product do
  @moduledoc """
  Product struct
  """
  @enforce_keys [:code, :name, :price]
  defstruct @enforce_keys
end

defmodule TILEX.ExternalResource do
  @moduledoc """
  The `@external_resource` Elixir module attribute is a convenience that  
  allows the compiler to recompile this module whenever that file changes.
  
  The `:code.priv_dir/1` function returns the full, possibly expanded, name 
  of the `priv` directory. 
  """

  @external_resource products_path = 
    Path.join(:code.priv_dir(:til_elixir), "data/products.csv")

  # The following code loads the products from the "products.csv" file and stores 
  # them as a List of `%Product{}` structs into the `@products` module attribute.
  @products (for line <- File.stream!(products_path, [], :line) |> Stream.drop(1) do
    [code, name, price] = line |> String.replace("\n", "") |> String.split(",")
    
    %TILEX.ExternalResource.Product{code: code, name: name, price: price}
  end)

  @doc """
  Lists all products sorted alphabetically by code.

  ## Examples

      iex> TILEX.ExternalResource.list_products()
      [%TILEX.ExternalResource.Product{code: "CAP", name: "Special Cap", price: "20.00"},
       %TILEX.ExternalResource.Product{code: "MUG", name: "Design Mug", price: "8.00"},
       %TILEX.ExternalResource.Product{code: "PEN", name: "Gel Pen", price: "3.50"}]
       
  """
  def list_products() do
    Enum.sort(@products, &(&1.code <= &2.code))
  end
end
