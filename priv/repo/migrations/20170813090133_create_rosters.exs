defmodule RosterApp.Repo.Migrations.CreateRosters do
  use Ecto.Migration

  def change do
    create table(:rosters) do
      add :name, :string, null: false

      timestamps()
    end

    alter table(:shifts) do
      add :roster_id, references(:rosters, on_delete: :nothing), null: false
    end
  end
end
