defmodule GaviriaRaicesApp.Repo.Migrations.CreateUrbanizaciones do
  use Ecto.Migration

  def change do
    create table(:urbanizaciones, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :nombre, :string
      add :direccion, :string
      add :ciudad, :string
      add :num_empleados, :integer

      timestamps()
    end
  end
end
