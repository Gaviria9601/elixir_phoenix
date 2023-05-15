defmodule GaviriaRaicesApp.UrbanizacionesTest do
  use GaviriaRaicesApp.DataCase

  alias GaviriaRaicesApp.Urbanizaciones

  describe "urbanizaciones" do
    alias GaviriaRaicesApp.Urbanizaciones.Urbanizacion

    import GaviriaRaicesApp.UrbanizacionesFixtures

    @invalid_attrs %{ciudad: nil, direccion: nil, nombre: nil, num_empleados: nil}

    test "list_urbanizaciones/0 returns all urbanizaciones" do
      urbanizacion = urbanizacion_fixture()
      assert Urbanizaciones.list_urbanizaciones() == [urbanizacion]
    end

    test "get_urbanizacion!/1 returns the urbanizacion with given id" do
      urbanizacion = urbanizacion_fixture()
      assert Urbanizaciones.get_urbanizacion!(urbanizacion.id) == urbanizacion
    end

    test "create_urbanizacion/1 with valid data creates a urbanizacion" do
      valid_attrs = %{ciudad: "some ciudad", direccion: "some direccion", nombre: "some nombre", num_empleados: 42}

      assert {:ok, %Urbanizacion{} = urbanizacion} = Urbanizaciones.create_urbanizacion(valid_attrs)
      assert urbanizacion.ciudad == "some ciudad"
      assert urbanizacion.direccion == "some direccion"
      assert urbanizacion.nombre == "some nombre"
      assert urbanizacion.num_empleados == 42
    end

    test "create_urbanizacion/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Urbanizaciones.create_urbanizacion(@invalid_attrs)
    end

    test "update_urbanizacion/2 with valid data updates the urbanizacion" do
      urbanizacion = urbanizacion_fixture()
      update_attrs = %{ciudad: "some updated ciudad", direccion: "some updated direccion", nombre: "some updated nombre", num_empleados: 43}

      assert {:ok, %Urbanizacion{} = urbanizacion} = Urbanizaciones.update_urbanizacion(urbanizacion, update_attrs)
      assert urbanizacion.ciudad == "some updated ciudad"
      assert urbanizacion.direccion == "some updated direccion"
      assert urbanizacion.nombre == "some updated nombre"
      assert urbanizacion.num_empleados == 43
    end

    test "update_urbanizacion/2 with invalid data returns error changeset" do
      urbanizacion = urbanizacion_fixture()
      assert {:error, %Ecto.Changeset{}} = Urbanizaciones.update_urbanizacion(urbanizacion, @invalid_attrs)
      assert urbanizacion == Urbanizaciones.get_urbanizacion!(urbanizacion.id)
    end

    test "delete_urbanizacion/1 deletes the urbanizacion" do
      urbanizacion = urbanizacion_fixture()
      assert {:ok, %Urbanizacion{}} = Urbanizaciones.delete_urbanizacion(urbanizacion)
      assert_raise Ecto.NoResultsError, fn -> Urbanizaciones.get_urbanizacion!(urbanizacion.id) end
    end

    test "change_urbanizacion/1 returns a urbanizacion changeset" do
      urbanizacion = urbanizacion_fixture()
      assert %Ecto.Changeset{} = Urbanizaciones.change_urbanizacion(urbanizacion)
    end
  end
end
