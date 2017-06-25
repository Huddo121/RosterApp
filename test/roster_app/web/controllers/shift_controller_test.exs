defmodule RosterApp.Web.ShiftControllerTest do
  use RosterApp.Web.ConnCase

  alias RosterApp.Rostering

  @create_attrs %{end_time: ~N[2010-04-17 14:00:00.000000], start_time: ~N[2010-04-17 14:00:00.000000]}
  @update_attrs %{end_time: ~N[2011-05-18 15:01:01.000000], start_time: ~N[2011-05-18 15:01:01.000000]}
  @invalid_attrs %{end_time: nil, start_time: nil}

  def fixture(:shift) do
    {:ok, shift} = Rostering.create_shift(@create_attrs)
    shift
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, shift_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing Shifts"
  end

  test "renders form for new shifts", %{conn: conn} do
    conn = get conn, shift_path(conn, :new)
    assert html_response(conn, 200) =~ "New Shift"
  end

  test "creates shift and redirects to show when data is valid", %{conn: conn} do
    conn = post conn, shift_path(conn, :create), shift: @create_attrs

    assert %{id: id} = redirected_params(conn)
    assert redirected_to(conn) == shift_path(conn, :show, id)

    conn = get conn, shift_path(conn, :show, id)
    assert html_response(conn, 200) =~ "Show Shift"
  end

  test "does not create shift and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, shift_path(conn, :create), shift: @invalid_attrs
    assert html_response(conn, 200) =~ "New Shift"
  end

  test "renders form for editing chosen shift", %{conn: conn} do
    shift = fixture(:shift)
    conn = get conn, shift_path(conn, :edit, shift)
    assert html_response(conn, 200) =~ "Edit Shift"
  end

  test "updates chosen shift and redirects when data is valid", %{conn: conn} do
    shift = fixture(:shift)
    conn = put conn, shift_path(conn, :update, shift), shift: @update_attrs
    assert redirected_to(conn) == shift_path(conn, :show, shift)

    conn = get conn, shift_path(conn, :show, shift)
    assert html_response(conn, 200)
  end

  test "does not update chosen shift and renders errors when data is invalid", %{conn: conn} do
    shift = fixture(:shift)
    conn = put conn, shift_path(conn, :update, shift), shift: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit Shift"
  end

  test "deletes chosen shift", %{conn: conn} do
    shift = fixture(:shift)
    conn = delete conn, shift_path(conn, :delete, shift)
    assert redirected_to(conn) == shift_path(conn, :index)
    assert_error_sent 404, fn ->
      get conn, shift_path(conn, :show, shift)
    end
  end
end
