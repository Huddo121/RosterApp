defmodule RosterApp.Repo.Migrations.CreateShifts do
  use Ecto.Migration

  def change do
    create table(:shifts) do
      add :start_time, :naive_datetime
      add :end_time, :naive_datetime
      add :user_id, references(:users, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:shifts, [:user_id])
  end
end
