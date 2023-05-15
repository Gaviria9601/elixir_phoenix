defmodule GaviriaRaicesAppWeb.UrbanizacionJSON do
  alias GaviriaRaicesApp.Urbanizaciones.Urbanizacion

  @doc """
  Renders a list of urbanizaciones.
  """
  def index(%{urbanizaciones: urbanizaciones}) do
    %{data: for(urbanizacion <- urbanizaciones, do: data(urbanizacion))}
  end

  @doc """
  Renders a single urbanizacion.
  """
  def show(%{urbanizacion: urbanizacion}) do
    %{data: data(urbanizacion)}
  end

  defp data(%Urbanizacion{} = urbanizacion) do
    apartamentos = urbanizacion.apartamentos
                |> Enum.map(& Map.from_struct(&1))
                |> Enum.map(& Enum.reduce([:__meta__, :urbanizacion, :urbanizacion_id, :inserted_at, :updated_at], &1, fn key, acc -> Map.delete(acc, key) end))

    %{
      id: urbanizacion.id,
      nombre: urbanizacion.nombre,
      direccion: urbanizacion.direccion,
      ciudad: urbanizacion.ciudad,
      num_empleados: urbanizacion.num_empleados,
      apartamentos: apartamentos
    }
  end
end
