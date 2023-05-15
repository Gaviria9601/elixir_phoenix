defmodule GaviriaRaicesApp.Apartamentos do
  @moduledoc """
  The Apartamentos context.
  """

  import Ecto.Query, warn: false
  alias GaviriaRaicesApp.Repo

  alias GaviriaRaicesApp.Apartamentos.Apartamento

  @doc """
  Returns the list of apartamentos.

  ## Examples

      iex> list_apartamentos()
      [%Apartamento{}, ...]

  """
  def list_apartamentos do
    Repo.all(Apartamento) |> Repo.preload(:urbanizacion)
  end

  @doc """
  Gets a single apartamento.

  Raises `Ecto.NoResultsError` if the Apartamento does not exist.

  ## Examples

      iex> get_apartamento!(123)
      %Apartamento{}

      iex> get_apartamento!(456)
      ** (Ecto.NoResultsError)

  """
  def get_apartamento!(id), do: Repo.get!(Apartamento, id) |> Repo.preload(:urbanizacion)

  @doc """
  Returns the list of apartamento per x num_hab.

  ## Examples

      iex> list_urbanizaciones()
      [%Urbanizacion{}, ...]

  """
  def get_apartamentos_num_hab(num_hab), do: Repo.all(from u in Apartamento, where: u.num_hab == ^num_hab) |> Repo.preload(:urbanizacion)

  @doc """
  Returns the list of apartamento per x num_hab.

  ## Examples

      iex> list_urbanizaciones()
      [%Urbanizacion{}, ...]

  """
  def get_apartamentos_valor_admin(valor_admin_min,valor_admin_max), do: Repo.all(from u in Apartamento, where: u.valor_admin >= ^valor_admin_min and u.valor_admin <= ^valor_admin_max) |> Repo.preload(:urbanizacion)

  @doc """
  Creates a apartamento.

  ## Examples

      iex> create_apartamento(%{field: value})
      {:ok, %Apartamento{}}

      iex> create_apartamento(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_apartamento(attrs \\ %{}) do
    %Apartamento{}
    |> Repo.preload(:urbanizacion)
    |> Apartamento.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a apartamento.

  ## Examples

      iex> update_apartamento(apartamento, %{field: new_value})
      {:ok, %Apartamento{}}

      iex> update_apartamento(apartamento, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_apartamento(%Apartamento{} = apartamento, attrs) do
    apartamento
    |> Apartamento.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a apartamento.

  ## Examples

      iex> delete_apartamento(apartamento)
      {:ok, %Apartamento{}}

      iex> delete_apartamento(apartamento)
      {:error, %Ecto.Changeset{}}

  """
  def delete_apartamento(%Apartamento{} = apartamento) do
    Repo.delete(apartamento)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking apartamento changes.

  ## Examples

      iex> change_apartamento(apartamento)
      %Ecto.Changeset{data: %Apartamento{}}

  """
  def change_apartamento(%Apartamento{} = apartamento, attrs \\ %{}) do
    Apartamento.changeset(apartamento, attrs)
  end
end
