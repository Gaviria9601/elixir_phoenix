defmodule GaviriaRaicesAppWeb.ApartamentoController do
  use GaviriaRaicesAppWeb, :controller

  alias GaviriaRaicesApp.Apartamentos
  alias GaviriaRaicesApp.Apartamentos.Apartamento

  action_fallback GaviriaRaicesAppWeb.FallbackController

  def index(conn, _params) do
    apartamentos = Apartamentos.list_apartamentos()
    render(conn, :index, apartamentos: apartamentos)
  end

  def create(conn, %{"apartamento" => apartamento_params}) do
    with {:ok, %Apartamento{} = apartamento} <- Apartamentos.create_apartamento(apartamento_params) do
      conn
      |> put_status(:created)
      #|> put_resp_header("location", ~p"/api/apartamentos/#{apartamento}")
      |> render(:show, apartamento: apartamento)
    end
  end

  def show(conn, %{"id" => id}) do
    apartamento = Apartamentos.get_apartamento!(id)
    render(conn, :show, apartamento: apartamento)
  end

  def search_by_num_hab(conn, %{"num_hab" => num_hab}) do
    apartamentos = Apartamentos.get_apartamentos_num_hab(num_hab)
    render(conn, :index, apartamentos: apartamentos)
  end

  def search_by_valor_admin(conn, %{"valor_admin_min" => valor_admin_min, "valor_admin_max" => valor_admin_max}) do
    apartamentos = Apartamentos.get_apartamentos_valor_admin(valor_admin_min,valor_admin_max)
    render(conn, :index, apartamentos: apartamentos)
  end

  def update(conn, %{"id" => id, "apartamento" => apartamento_params}) do
    apartamento = Apartamentos.get_apartamento!(id)

    with {:ok, %Apartamento{} = apartamento} <- Apartamentos.update_apartamento(apartamento, apartamento_params) do
      render(conn, :show, apartamento: apartamento)
    end
  end

  def delete(conn, %{"id" => id}) do
    apartamento = Apartamentos.get_apartamento!(id)

    with {:ok, %Apartamento{}} <- Apartamentos.delete_apartamento(apartamento) do
      send_resp(conn, :no_content, "")
    end
  end
end
