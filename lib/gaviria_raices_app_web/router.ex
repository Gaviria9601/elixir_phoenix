defmodule GaviriaRaicesAppWeb.Router do
  use GaviriaRaicesAppWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GaviriaRaicesAppWeb do
    pipe_through :api
  end
end
