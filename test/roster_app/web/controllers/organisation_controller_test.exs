defmodule RosterApp.Web.OrganisationControllerTest do
  use RosterApp.Web.ConnCase

  alias RosterApp.Organisations

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:organisation) do
    {:ok, organisation} = Organisations.create_organisation(@create_attrs)
    organisation
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, organisation_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing Organisations"
  end

  test "renders form for new organisations", %{conn: conn} do
    conn = get conn, organisation_path(conn, :new)
    assert html_response(conn, 200) =~ "New Organisation"
  end

  test "creates organisation and redirects to show when data is valid", %{conn: conn} do
    conn = post conn, organisation_path(conn, :create), organisation: @create_attrs

    assert %{id: id} = redirected_params(conn)
    assert redirected_to(conn) == organisation_path(conn, :show, id)

    conn = get conn, organisation_path(conn, :show, id)
    assert html_response(conn, 200) =~ "Show Organisation"
  end

  test "does not create organisation and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, organisation_path(conn, :create), organisation: @invalid_attrs
    assert html_response(conn, 200) =~ "New Organisation"
  end

  test "renders form for editing chosen organisation", %{conn: conn} do
    organisation = fixture(:organisation)
    conn = get conn, organisation_path(conn, :edit, organisation)
    assert html_response(conn, 200) =~ "Edit Organisation"
  end

  test "updates chosen organisation and redirects when data is valid", %{conn: conn} do
    organisation = fixture(:organisation)
    conn = put conn, organisation_path(conn, :update, organisation), organisation: @update_attrs
    assert redirected_to(conn) == organisation_path(conn, :show, organisation)

    conn = get conn, organisation_path(conn, :show, organisation)
    assert html_response(conn, 200) =~ "some updated name"
  end

  test "does not update chosen organisation and renders errors when data is invalid", %{conn: conn} do
    organisation = fixture(:organisation)
    conn = put conn, organisation_path(conn, :update, organisation), organisation: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit Organisation"
  end

  test "deletes chosen organisation", %{conn: conn} do
    organisation = fixture(:organisation)
    conn = delete conn, organisation_path(conn, :delete, organisation)
    assert redirected_to(conn) == organisation_path(conn, :index)
    assert_error_sent 404, fn ->
      get conn, organisation_path(conn, :show, organisation)
    end
  end
end
