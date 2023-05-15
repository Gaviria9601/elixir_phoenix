defmodule GaviriaRaicesApp.Repo.Migrations.CreateApartamentos do
  use Ecto.Migration

  def change do
    create table(:apartamentos, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :num_torre_apto, :integer
      add :dueño, :string
      add :valor_admin, :float
      add :num_hab, :integer
      add :antiguedad, :string
      add :mt2, :integer
      add :num_parqueadero, :integer
      add :urbanizacion_id, references(:urbanizaciones, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:apartamentos, [:urbanizacion_id])
  end
end
