defmodule GaviriaRaicesApp.ApartamentosTest do
  use GaviriaRaicesApp.DataCase

  alias GaviriaRaicesApp.Apartamentos

  describe "apartamentos" do
    alias GaviriaRaicesApp.Apartamentos.Apartamento

    import GaviriaRaicesApp.ApartamentosFixtures

    @invalid_attrs %{antiguedad: nil, dueño: nil, mt2: nil, num_hab: nil, num_parqueadero: nil, num_torre_apto: nil, valor_admin: nil}

    test "list_apartamentos/0 returns all apartamentos" do
      apartamento = apartamento_fixture()
      assert Apartamentos.list_apartamentos() == [apartamento]
    end

    test "get_apartamento!/1 returns the apartamento with given id" do
      apartamento = apartamento_fixture()
      assert Apartamentos.get_apartamento!(apartamento.id) == apartamento
    end

    test "create_apartamento/1 with valid data creates a apartamento" do
      valid_attrs = %{antiguedad: "some antiguedad", dueño: "some dueño", mt2: 42, num_hab: 42, num_parqueadero: 42, num_torre_apto: 42, valor_admin: 120.5}

      assert {:ok, %Apartamento{} = apartamento} = Apartamentos.create_apartamento(valid_attrs)
      assert apartamento.antiguedad == "some antiguedad"
      assert apartamento.dueño == "some dueño"
      assert apartamento.mt2 == 42
      assert apartamento.num_hab == 42
      assert apartamento.num_parqueadero == 42
      assert apartamento.num_torre_apto == 42
      assert apartamento.valor_admin == 120.5
    end

    test "create_apartamento/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Apartamentos.create_apartamento(@invalid_attrs)
    end

    test "update_apartamento/2 with valid data updates the apartamento" do
      apartamento = apartamento_fixture()
      update_attrs = %{antiguedad: "some updated antiguedad", dueño: "some updated dueño", mt2: 43, num_hab: 43, num_parqueadero: 43, num_torre_apto: 43, valor_admin: 456.7}

      assert {:ok, %Apartamento{} = apartamento} = Apartamentos.update_apartamento(apartamento, update_attrs)
      assert apartamento.antiguedad == "some updated antiguedad"
      assert apartamento.dueño == "some updated dueño"
      assert apartamento.mt2 == 43
      assert apartamento.num_hab == 43
      assert apartamento.num_parqueadero == 43
      assert apartamento.num_torre_apto == 43
      assert apartamento.valor_admin == 456.7
    end

    test "update_apartamento/2 with invalid data returns error changeset" do
      apartamento = apartamento_fixture()
      assert {:error, %Ecto.Changeset{}} = Apartamentos.update_apartamento(apartamento, @invalid_attrs)
      assert apartamento == Apartamentos.get_apartamento!(apartamento.id)
    end

    test "delete_apartamento/1 deletes the apartamento" do
      apartamento = apartamento_fixture()
      assert {:ok, %Apartamento{}} = Apartamentos.delete_apartamento(apartamento)
      assert_raise Ecto.NoResultsError, fn -> Apartamentos.get_apartamento!(apartamento.id) end
    end

    test "change_apartamento/1 returns a apartamento changeset" do
      apartamento = apartamento_fixture()
      assert %Ecto.Changeset{} = Apartamentos.change_apartamento(apartamento)
    end
  end
end
