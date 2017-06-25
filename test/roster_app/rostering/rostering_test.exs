defmodule RosterApp.RosteringTest do
  use RosterApp.DataCase

  alias RosterApp.Rostering

  describe "shifts" do
    alias RosterApp.Rostering.Shift

    @valid_attrs %{end_time: ~N[2010-04-17 14:00:00.000000], start_time: ~N[2010-04-17 14:00:00.000000]}
    @update_attrs %{end_time: ~N[2011-05-18 15:01:01.000000], start_time: ~N[2011-05-18 15:01:01.000000]}
    @invalid_attrs %{end_time: nil, start_time: nil}

    def shift_fixture(attrs \\ %{}) do
      {:ok, shift} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Rostering.create_shift()

      shift
    end

    test "list_shifts/0 returns all shifts" do
      shift = shift_fixture()
      assert Rostering.list_shifts() == [shift]
    end

    test "get_shift!/1 returns the shift with given id" do
      shift = shift_fixture()
      assert Rostering.get_shift!(shift.id) == shift
    end

    test "create_shift/1 with valid data creates a shift" do
      assert {:ok, %Shift{} = shift} = Rostering.create_shift(@valid_attrs)
      assert shift.end_time == ~N[2010-04-17 14:00:00.000000]
      assert shift.start_time == ~N[2010-04-17 14:00:00.000000]
    end

    test "create_shift/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Rostering.create_shift(@invalid_attrs)
    end

    test "update_shift/2 with valid data updates the shift" do
      shift = shift_fixture()
      assert {:ok, shift} = Rostering.update_shift(shift, @update_attrs)
      assert %Shift{} = shift
      assert shift.end_time == ~N[2011-05-18 15:01:01.000000]
      assert shift.start_time == ~N[2011-05-18 15:01:01.000000]
    end

    test "update_shift/2 with invalid data returns error changeset" do
      shift = shift_fixture()
      assert {:error, %Ecto.Changeset{}} = Rostering.update_shift(shift, @invalid_attrs)
      assert shift == Rostering.get_shift!(shift.id)
    end

    test "delete_shift/1 deletes the shift" do
      shift = shift_fixture()
      assert {:ok, %Shift{}} = Rostering.delete_shift(shift)
      assert_raise Ecto.NoResultsError, fn -> Rostering.get_shift!(shift.id) end
    end

    test "change_shift/1 returns a shift changeset" do
      shift = shift_fixture()
      assert %Ecto.Changeset{} = Rostering.change_shift(shift)
    end
  end
end
