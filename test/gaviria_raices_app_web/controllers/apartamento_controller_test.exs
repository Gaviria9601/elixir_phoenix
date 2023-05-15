defmodule GaviriaRaicesAppWeb.ApartamentoControllerTest do
  use GaviriaRaicesAppWeb.ConnCase

  import GaviriaRaicesApp.ApartamentosFixtures

  alias GaviriaRaicesApp.Apartamentos.Apartamento

  @create_attrs %{
    antiguedad: "some antiguedad",
    dueño: "some dueño",
    mt2: 42,
    num_hab: 42,
    num_parqueadero: 42,
    num_torre_apto: 42,
    valor_admin: 120.5
  }
  @update_attrs %{
    antiguedad: "some updated antiguedad",
    dueño: "some updated dueño",
    mt2: 43,
    num_hab: 43,
    num_parqueadero: 43,
    num_torre_apto: 43,
    valor_admin: 456.7
  }
  @invalid_attrs %{antiguedad: nil, dueño: nil, mt2: nil, num_hab: nil, num_parqueadero: nil, num_torre_apto: nil, valor_admin: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all apartamentos", %{conn: conn} do
      conn = get(conn, ~p"/api/apartamentos")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create apartamento" do
    test "renders apartamento when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/apartamentos", apartamento: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/apartamentos/#{id}")

      assert %{
               "id" => ^id,
               "antiguedad" => "some antiguedad",
               "dueño" => "some dueño",
               "mt2" => 42,
               "num_hab" => 42,
               "num_parqueadero" => 42,
               "num_torre_apto" => 42,
               "valor_admin" => 120.5
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/apartamentos", apartamento: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update apartamento" do
    setup [:create_apartamento]

    test "renders apartamento when data is valid", %{conn: conn, apartamento: %Apartamento{id: id} = apartamento} do
      conn = put(conn, ~p"/api/apartamentos/#{apartamento}", apartamento: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/apartamentos/#{id}")

      assert %{
               "id" => ^id,
               "antiguedad" => "some updated antiguedad",
               "dueño" => "some updated dueño",
               "mt2" => 43,
               "num_hab" => 43,
               "num_parqueadero" => 43,
               "num_torre_apto" => 43,
               "valor_admin" => 456.7
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, apartamento: apartamento} do
      conn = put(conn, ~p"/api/apartamentos/#{apartamento}", apartamento: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete apartamento" do
    setup [:create_apartamento]

    test "deletes chosen apartamento", %{conn: conn, apartamento: apartamento} do
      conn = delete(conn, ~p"/api/apartamentos/#{apartamento}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/apartamentos/#{apartamento}")
      end
    end
  end

  defp create_apartamento(_) do
    apartamento = apartamento_fixture()
    %{apartamento: apartamento}
  end
end
