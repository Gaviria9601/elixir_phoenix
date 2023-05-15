defmodule GaviriaRaicesApp.Apartamentos.Apartamento do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "apartamentos" do
    field :antiguedad, :string
    field :dueño, :string
    field :mt2, :integer
    field :num_hab, :integer
    field :num_parqueadero, :integer
    field :num_torre_apto, :integer
    field :valor_admin, :float
    belongs_to :urbanizacion, GaviriaRaicesApp.Urbanizaciones.Urbanizacion
    timestamps()
  end

  @doc false
  def changeset(apartamento, attrs) do
    apartamento
    |> cast(attrs, [:num_torre_apto, :dueño, :valor_admin, :num_hab, :antiguedad, :mt2, :num_parqueadero, :urbanizacion_id])
    |> validate_required([:num_torre_apto, :dueño, :valor_admin, :num_hab, :antiguedad, :mt2, :num_parqueadero])
  end


end
