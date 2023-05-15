defmodule GaviriaRaicesAppWeb.Router do
  alias GaviriaRaicesAppWeb.UrbanizacionController
  alias GaviriaRaicesAppWeb.ApartamentoController
  use GaviriaRaicesAppWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api" do
    pipe_through :api

    resources "/urbanizaciones", UrbanizacionController, except: [:edit,:new,:update, :show]
    get "/urbanizaciones/:id", UrbanizacionController, :show
    get "/urbanizaciones/ciudad/search", UrbanizacionController, :search_by_city
    put "/urbanizaciones/:id", UrbanizacionController, :update
    resources "/apartamentos", ApartamentoController, except: [:edit,:new,:update,:show]
    get "/apartamentos/:id", ApartamentoController, :show
    get "/apartamentos/num_hab/search", ApartamentoController, :search_by_num_hab
    get "/apartamentos/valor_admin/search", ApartamentoController, :search_by_valor_admin
    put "/apartamentos/:id", ApartamentoController, :update
  end
end
