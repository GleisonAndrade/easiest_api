defmodule EasiestAppWeb.Router do
  use EasiestAppWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug :fetch_session
  end

  pipeline :api_auth do
    plug :ensure_authenticated
  end

  scope "/api", EasiestAppWeb do
    pipe_through :api
    post "/users/sign_in", UserController, :sign_in
    resources "/users", UserController, only: [:create]
  end

  scope "/api", EasiestAppWeb do
    pipe_through [:api, :api_auth]
    resources "/users", UserController, except: [:new, :edit, :create]
  end
  
  # Plug function
  defp ensure_authenticated(conn, _opts) do
    current_user_id = get_session(conn, :current_user_id)

    if current_user_id do
      conn
    else
      conn
      |> put_status(:unauthorized)
      |> put_view(EasiestAppWeb.ErrorView)
      |> render("401.json", message: "Unauthenticated user")
      |> halt()
    end
  end

end
