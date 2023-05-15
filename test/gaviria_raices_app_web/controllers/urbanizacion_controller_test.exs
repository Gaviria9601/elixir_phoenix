defmodule GaviriaRaicesAppWeb.UrbanizacionControllerTest do
  use GaviriaRaicesAppWeb.ConnCase

  import GaviriaRaicesApp.UrbanizacionesFixtures

  alias GaviriaRaicesApp.Urbanizaciones.Urbanizacion

  @create_attrs %{
    ciudad: "some ciudad",
    direccion: "some direccion",
    nombre: "some nombre",
    num_empleados: 42
  }
  @update_attrs %{
    ciudad: "some updated ciudad",
    direccion: "some updated direccion",
    nombre: "some updated nombre",
    num_empleados: 43
  }
  @invalid_attrs %{ciudad: nil, direccion: nil, nombre: nil, num_empleados: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all urbanizaciones", %{conn: conn} do
      conn = get(conn, ~p"/api/urbanizaciones")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create urbanizacion" do
    test "renders urbanizacion when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/urbanizaciones", urbanizacion: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/urbanizaciones/#{id}")

      assert %{
               "id" => ^id,
               "ciudad" => "some ciudad",
               "direccion" => "some direccion",
               "nombre" => "some nombre",
               "num_empleados" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/urbanizaciones", urbanizacion: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update urbanizacion" do
    setup [:create_urbanizacion]

    test "renders urbanizacion when data is valid", %{conn: conn, urbanizacion: %Urbanizacion{id: id} = urbanizacion} do
      conn = put(conn, ~p"/api/urbanizaciones/#{urbanizacion}", urbanizacion: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/urbanizaciones/#{id}")

      assert %{
               "id" => ^id,
               "ciudad" => "some updated ciudad",
               "direccion" => "some updated direccion",
               "nombre" => "some updated nombre",
               "num_empleados" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, urbanizacion: urbanizacion} do
      conn = put(conn, ~p"/api/urbanizaciones/#{urbanizacion}", urbanizacion: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete urbanizacion" do
    setup [:create_urbanizacion]

    test "deletes chosen urbanizacion", %{conn: conn, urbanizacion: urbanizacion} do
      conn = delete(conn, ~p"/api/urbanizaciones/#{urbanizacion}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/urbanizaciones/#{urbanizacion}")
      end
    end
  end

  defp create_urbanizacion(_) do
    urbanizacion = urbanizacion_fixture()
    %{urbanizacion: urbanizacion}
  end
end
