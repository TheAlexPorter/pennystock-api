defmodule PennystockApiWeb.StockController do
  use PennystockApiWeb, :controller

  def index(conn, %{"stock" => stock}) do
    {{year, month, day}, _} = :os.timestamp() |> :calendar.now_to_datetime()

    url =
      "https://api.nasdaq.com/api/quote/#{stock}/historical?assetclass=stocks&fromdate=#{year}-#{
        month - 1
      }-#{day}&limit=18&todate=#{year}-#{month}-#{day}"

    {:ok, %HTTPoison.Response{body: body}} = HTTPoison.get(url)

    render(conn, "index.json", stock: body)
  end
end
