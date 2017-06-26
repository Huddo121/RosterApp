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

  describe "rosters" do
    alias RosterApp.Rostering.Roster

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def roster_fixture(attrs \\ %{}) do
      {:ok, roster} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Rostering.create_roster()

      roster
    end

    test "list_rosters/0 returns all rosters" do
      roster = roster_fixture()
      assert Rostering.list_rosters() == [roster]
    end

    test "get_roster!/1 returns the roster with given id" do
      roster = roster_fixture()
      assert Rostering.get_roster!(roster.id) == roster
    end

    test "create_roster/1 with valid data creates a roster" do
      assert {:ok, %Roster{} = roster} = Rostering.create_roster(@valid_attrs)
      assert roster.name == "some name"
    end

    test "create_roster/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Rostering.create_roster(@invalid_attrs)
    end

    test "update_roster/2 with valid data updates the roster" do
      roster = roster_fixture()
      assert {:ok, roster} = Rostering.update_roster(roster, @update_attrs)
      assert %Roster{} = roster
      assert roster.name == "some updated name"
    end

    test "update_roster/2 with invalid data returns error changeset" do
      roster = roster_fixture()
      assert {:error, %Ecto.Changeset{}} = Rostering.update_roster(roster, @invalid_attrs)
      assert roster == Rostering.get_roster!(roster.id)
    end

    test "delete_roster/1 deletes the roster" do
      roster = roster_fixture()
      assert {:ok, %Roster{}} = Rostering.delete_roster(roster)
      assert_raise Ecto.NoResultsError, fn -> Rostering.get_roster!(roster.id) end
    end

    test "change_roster/1 returns a roster changeset" do
      roster = roster_fixture()
      assert %Ecto.Changeset{} = Rostering.change_roster(roster)
    end
  end
end
