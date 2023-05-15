defmodule GaviriaRaicesAppWeb.ApartamentoJSON do
  alias GaviriaRaicesApp.Apartamentos.Apartamento

  @doc """
  Renders a list of apartamentos.
  """
  def index(%{apartamentos: apartamentos}) do
    %{data: for(apartamento <- apartamentos, do: data(apartamento))}
  end

  @doc """
  Renders a single apartamento.
  """
  def show(%{apartamento: apartamento}) do
    %{data: data(apartamento)}
  end

  defp data(%Apartamento{} = apartamento) do
    urbanizacion =
      case apartamento.urbanizacion do
        nil -> apartamento.urbanizacion_id
        _ ->
          [apartamento.urbanizacion]
          |> Enum.map(& Map.from_struct(&1))
          |> Enum.map(& Enum.reduce([:__meta__, :apartamentos, :inserted_at, :updated_at], &1, fn key, val -> Map.delete(val, key) end))
          |> List.first
        end
    %{
      id: apartamento.id,
      num_torre_apto: apartamento.num_torre_apto,
      dueño: apartamento.dueño,
      valor_admin: apartamento.valor_admin |> inspect(limit: 10),
      num_hab: apartamento.num_hab,
      antiguedad: apartamento.antiguedad,
      mt2: apartamento.mt2,
      num_parqueadero: apartamento.num_parqueadero,
      urbanizacion: urbanizacion
    }
  end
end
