defmodule PennystockApiWeb.Router do
  use PennystockApiWeb, :router

  scope "/", PennystockApiWeb do
    get "/get_stock/:stock", StockController, :index
  end
end
