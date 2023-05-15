defmodule GaviriaRaicesAppWeb.UrbanizacionController do
  use GaviriaRaicesAppWeb, :controller

  alias GaviriaRaicesApp.Urbanizaciones
  alias GaviriaRaicesApp.Urbanizaciones.Urbanizacion

  action_fallback GaviriaRaicesAppWeb.FallbackController

  def index(conn, _params) do
    urbanizaciones = Urbanizaciones.list_urbanizaciones()
    render(conn, :index, urbanizaciones: urbanizaciones)
  end

  def create(conn, %{"urbanizacion" => urbanizacion_params}) do
    with {:ok, %Urbanizacion{} = urbanizacion} <- Urbanizaciones.create_urbanizacion(urbanizacion_params) do
      conn
      |> put_status(:created)
      #|> put_resp_header("location", ~p"/api/urbanizaciones/#{urbanizacion}")
      |> render(:show, urbanizacion: urbanizacion)
    end
  end

  def show(conn, %{"id" => id}) do
    urbanizacion = Urbanizaciones.get_urbanizacion!(id)
    render(conn, :show, urbanizacion: urbanizacion)
  end

  def search_by_city(conn, %{"ciudad" => ciudad}) do
    urbanizaciones = Urbanizaciones.get_urbanizaciones_ciudad(ciudad)
    render(conn, :index, urbanizaciones: urbanizaciones)
  end

  def update(conn, %{"id" => id, "urbanizacion" => urbanizacion_params}) do
    urbanizacion = Urbanizaciones.get_urbanizacion!(id)

    with {:ok, %Urbanizacion{} = urbanizacion} <- Urbanizaciones.update_urbanizacion(urbanizacion, urbanizacion_params) do
      render(conn, :show, urbanizacion: urbanizacion)
    end
  end

  def delete(conn, %{"id" => id}) do
    urbanizacion = Urbanizaciones.get_urbanizacion!(id)

    with {:ok, %Urbanizacion{}} <- Urbanizaciones.delete_urbanizacion(urbanizacion) do
      send_resp(conn, :no_content, "")
    end
  end
end
