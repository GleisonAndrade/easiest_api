defmodule EasiestAppWeb.FallbackController do
  @moduledoc """
  Translates controller action results into valid `Plug.Conn` responses.

  See `Phoenix.Controller.action_fallback/1` for more details.
  """
  use EasiestAppWeb, :controller

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(EasiestAppWeb.ErrorView)
    |> render(:"404")
  end

  def call(conn, {:error, %Ecto.Changeset{}}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(MyAppWeb.ErrorView)
    |> render(:"422")
  end
end
