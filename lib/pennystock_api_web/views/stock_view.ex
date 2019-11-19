defmodule PennystockApiWeb.StockView do
  use PennystockApiWeb, :view

  def render("index.json", %{stock: stock}) do
    %{stock: stock}
  end
end
