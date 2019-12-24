defmodule EasiestApp.Repo do
  use Ecto.Repo,
    otp_app: :easiest,
    adapter: Ecto.Adapters.Postgres
end
