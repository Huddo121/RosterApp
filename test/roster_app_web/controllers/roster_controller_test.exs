defmodule RosterAppWeb.RosterControllerTest do
  use RosterAppWeb.ConnCase

  alias RosterApp.Rostering

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:roster) do
    {:ok, roster} = Rostering.create_roster(@create_attrs)
    roster
  end

  describe "index" do
    test "lists all rosters", %{conn: conn} do
      conn = get conn, roster_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Rosters"
    end
  end

  describe "new roster" do
    test "renders form", %{conn: conn} do
      conn = get conn, roster_path(conn, :new)
      assert html_response(conn, 200) =~ "New Roster"
    end
  end

  describe "create roster" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, roster_path(conn, :create), roster: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == roster_path(conn, :show, id)

      conn = get conn, roster_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Roster"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, roster_path(conn, :create), roster: @invalid_attrs
      assert html_response(conn, 200) =~ "New Roster"
    end
  end

  describe "edit roster" do
    setup [:create_roster]

    test "renders form for editing chosen roster", %{conn: conn, roster: roster} do
      conn = get conn, roster_path(conn, :edit, roster)
      assert html_response(conn, 200) =~ "Edit Roster"
    end
  end

  describe "update roster" do
    setup [:create_roster]

    test "redirects when data is valid", %{conn: conn, roster: roster} do
      conn = put conn, roster_path(conn, :update, roster), roster: @update_attrs
      assert redirected_to(conn) == roster_path(conn, :show, roster)

      conn = get conn, roster_path(conn, :show, roster)
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, roster: roster} do
      conn = put conn, roster_path(conn, :update, roster), roster: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Roster"
    end
  end

  describe "delete roster" do
    setup [:create_roster]

    test "deletes chosen roster", %{conn: conn, roster: roster} do
      conn = delete conn, roster_path(conn, :delete, roster)
      assert redirected_to(conn) == roster_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, roster_path(conn, :show, roster)
      end
    end
  end

  defp create_roster(_) do
    roster = fixture(:roster)
    {:ok, roster: roster}
  end
end
