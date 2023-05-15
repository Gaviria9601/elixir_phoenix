defmodule GaviriaRaicesApp.Urbanizaciones.Urbanizacion do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "urbanizaciones" do
    field :ciudad, :string
    field :direccion, :string
    field :nombre, :string
    field :num_empleados, :integer
    has_many :apartamentos, GaviriaRaicesApp.Apartamentos.Apartamento
    timestamps()
  end

  @doc false
  def changeset(urbanizacion, attrs) do
    urbanizacion
    |> cast(attrs, [:nombre, :direccion, :ciudad, :num_empleados])
    |> validate_required([:nombre, :direccion, :ciudad, :num_empleados])
    |> validate_format(:ciudad, ~r/^[A-Za-z\s]+,[A-Za-z\s]+$/, message: "Invalido formato de ciudad (Ej: Armenia,Quindio)")
    |> unique_constraint(:nombre, message: "La urbanización ya esta registrado en esta ciudad")
  end
end
