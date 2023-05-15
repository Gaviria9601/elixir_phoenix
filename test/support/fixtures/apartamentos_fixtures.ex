defmodule GaviriaRaicesApp.ApartamentosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `GaviriaRaicesApp.Apartamentos` context.
  """

  @doc """
  Generate a apartamento.
  """
  def apartamento_fixture(attrs \\ %{}) do
    {:ok, apartamento} =
      attrs
      |> Enum.into(%{
        antiguedad: "some antiguedad",
        dueño: "some dueño",
        mt2: 42,
        num_hab: 42,
        num_parqueadero: 42,
        num_torre_apto: 42,
        valor_admin: 120.5
      })
      |> GaviriaRaicesApp.Apartamentos.create_apartamento()

    apartamento
  end
end
