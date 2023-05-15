defmodule GaviriaRaicesApp.Urbanizaciones do
  @moduledoc """
  The Urbanizaciones context.
  """

  import Ecto.Query, warn: false
  alias GaviriaRaicesApp.Repo

  alias GaviriaRaicesApp.Urbanizaciones.Urbanizacion

  @doc """
  Returns the list of urbanizaciones.

  ## Examples

      iex> list_urbanizaciones()
      [%Urbanizacion{}, ...]

  """
  def list_urbanizaciones do
    Repo.all(Urbanizacion) |> Repo.preload(:apartamentos)
  end

  @doc """
  Returns the list of urbanizaciones per x ciudad.

  ## Examples

      iex> list_urbanizaciones()
      [%Urbanizacion{}, ...]

  """
  def get_urbanizaciones_ciudad(ciudad), do: Repo.all(from u in Urbanizacion, where: u.ciudad == ^ciudad) |> Repo.preload(:apartamentos)

  @doc """
  Gets a single urbanizacion.

  Raises `Ecto.NoResultsError` if the Urbanizacion does not exist.

  ## Examples

      iex> get_urbanizacion!(123)
      %Urbanizacion{}

      iex> get_urbanizacion!(456)
      ** (Ecto.NoResultsError)

  """
  def get_urbanizacion!(id), do: Repo.get!(Urbanizacion, id) |> Repo.preload(:apartamentos)


  @doc """
  Creates a urbanizacion.

  ## Examples

      iex> create_urbanizacion(%{field: value})
      {:ok, %Urbanizacion{}}

      iex> create_urbanizacion(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_urbanizacion(attrs \\ %{}) do
    %Urbanizacion{}
    |> Repo.preload(:apartamentos)
    |> Urbanizacion.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a urbanizacion.

  ## Examples

      iex> update_urbanizacion(urbanizacion, %{field: new_value})
      {:ok, %Urbanizacion{}}

      iex> update_urbanizacion(urbanizacion, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_urbanizacion(%Urbanizacion{} = urbanizacion, attrs) do
    urbanizacion
    |> Urbanizacion.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a urbanizacion.

  ## Examples

      iex> delete_urbanizacion(urbanizacion)
      {:ok, %Urbanizacion{}}

      iex> delete_urbanizacion(urbanizacion)
      {:error, %Ecto.Changeset{}}

  """
  def delete_urbanizacion(%Urbanizacion{} = urbanizacion) do
    Repo.delete(urbanizacion)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking urbanizacion changes.

  ## Examples

      iex> change_urbanizacion(urbanizacion)
      %Ecto.Changeset{data: %Urbanizacion{}}

  """
  def change_urbanizacion(%Urbanizacion{} = urbanizacion, attrs \\ %{}) do
    Urbanizacion.changeset(urbanizacion, attrs)
  end
end
