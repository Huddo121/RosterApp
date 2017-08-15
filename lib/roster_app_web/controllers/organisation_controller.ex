defmodule RosterAppWeb.OrganisationController do
  use RosterAppWeb, :controller

  alias RosterApp.Organisations
  alias RosterApp.Organisations.Organisation

  def index(conn, _params) do
    organisations = Organisations.list_organisations()
    render(conn, "index.html", organisations: organisations)
  end

  def new(conn, _params) do
    changeset = Organisations.change_organisation(%Organisation{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"organisation" => organisation_params}) do
    case Organisations.create_organisation(organisation_params) do
      {:ok, organisation} ->
        conn
        |> put_flash(:info, "Organisation created successfully.")
        |> redirect(to: organisation_path(conn, :show, organisation))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    organisation = Organisations.get_organisation!(id)
    render(conn, "show.html", organisation: organisation)
  end

  def edit(conn, %{"id" => id}) do
    organisation = Organisations.get_organisation!(id)
    changeset = Organisations.change_organisation(organisation)
    render(conn, "edit.html", organisation: organisation, changeset: changeset)
  end

  def update(conn, %{"id" => id, "organisation" => organisation_params}) do
    organisation = Organisations.get_organisation!(id)

    case Organisations.update_organisation(organisation, organisation_params) do
      {:ok, organisation} ->
        conn
        |> put_flash(:info, "Organisation updated successfully.")
        |> redirect(to: organisation_path(conn, :show, organisation))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", organisation: organisation, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    organisation = Organisations.get_organisation!(id)
    {:ok, _organisation} = Organisations.delete_organisation(organisation)

    conn
    |> put_flash(:info, "Organisation deleted successfully.")
    |> redirect(to: organisation_path(conn, :index))
  end
end
