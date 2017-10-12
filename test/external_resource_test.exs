defmodule TILEX.ExternalResourceTest do
  use ExUnit.Case, async: true
  doctest TILEX.ExternalResource  
  
  alias TILEX.ExternalResource

  describe "ExternalResource.list_products/0" do
    test "lists all products sorted alphabetically by code" do
      all_sorted_codes = 
        ExternalResource.list_products() 
        |> Enum.map(&Map.get(&1, :code))
      
      assert all_sorted_codes == ["CAP", "MUG", "PEN"]
    end
  end
end
