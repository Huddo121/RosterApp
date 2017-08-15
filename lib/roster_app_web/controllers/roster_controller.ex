defmodule RosterAppWeb.RosterController do
  use RosterAppWeb, :controller

  alias RosterApp.Rostering
  alias RosterApp.Rostering.Roster

  def index(conn, _params) do
    rosters = Rostering.list_rosters()
    render(conn, "index.html", rosters: rosters)
  end

  def new(conn, _params) do
    changeset = Rostering.change_roster(%Roster{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"roster" => roster_params}) do
    case Rostering.create_roster(roster_params) do
      {:ok, roster} ->
        conn
        |> put_flash(:info, "Roster created successfully.")
        |> redirect(to: roster_path(conn, :show, roster))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    roster = Rostering.get_roster!(id)
    render(conn, "show.html", roster: roster)
  end

  def edit(conn, %{"id" => id}) do
    roster = Rostering.get_roster!(id)
    changeset = Rostering.change_roster(roster)
    render(conn, "edit.html", roster: roster, changeset: changeset)
  end

  def update(conn, %{"id" => id, "roster" => roster_params}) do
    roster = Rostering.get_roster!(id)

    case Rostering.update_roster(roster, roster_params) do
      {:ok, roster} ->
        conn
        |> put_flash(:info, "Roster updated successfully.")
        |> redirect(to: roster_path(conn, :show, roster))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", roster: roster, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    roster = Rostering.get_roster!(id)
    {:ok, _roster} = Rostering.delete_roster(roster)

    conn
    |> put_flash(:info, "Roster deleted successfully.")
    |> redirect(to: roster_path(conn, :index))
  end
end
