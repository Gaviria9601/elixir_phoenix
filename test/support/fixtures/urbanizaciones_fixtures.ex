defmodule GaviriaRaicesApp.UrbanizacionesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `GaviriaRaicesApp.Urbanizaciones` context.
  """

  @doc """
  Generate a urbanizacion.
  """
  def urbanizacion_fixture(attrs \\ %{}) do
    {:ok, urbanizacion} =
      attrs
      |> Enum.into(%{
        ciudad: "some ciudad",
        direccion: "some direccion",
        nombre: "some nombre",
        num_empleados: 42
      })
      |> GaviriaRaicesApp.Urbanizaciones.create_urbanizacion()

    urbanizacion
  end
end
