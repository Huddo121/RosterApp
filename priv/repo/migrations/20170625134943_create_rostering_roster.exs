defmodule RosterApp.Repo.Migrations.CreateRosterApp.Rostering.Roster do
  use Ecto.Migration

  def change do
    create table(:rostering_rosters) do
      add :name, :string

      timestamps()
    end
    
    alter table(:rostering_shifts) do
      add :roster_id, references(:rostering_rosters, on_delete: :nothing), null: false
    end    

  end
end
