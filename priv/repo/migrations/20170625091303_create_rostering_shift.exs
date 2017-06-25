defmodule RosterApp.Repo.Migrations.CreateRosterApp.Rostering.Shift do
  use Ecto.Migration

  def change do
    create table(:rostering_shifts) do
      add :start_time, :naive_datetime
      add :end_time, :naive_datetime
      add :user_id, references(:accounts_users, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:rostering_shifts, [:user_id])
  end
end
