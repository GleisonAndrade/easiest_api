defmodule EasiestAppWeb.Router do
  use EasiestAppWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", EasiestAppWeb do
    pipe_through :api
    resources "/users", UserController, except: [:new, :edit]
  end

end
