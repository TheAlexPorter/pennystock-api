defmodule PennystockApi.Repo do
  use Ecto.Repo,
    otp_app: :pennystock_api,
    adapter: Ecto.Adapters.Postgres
end
