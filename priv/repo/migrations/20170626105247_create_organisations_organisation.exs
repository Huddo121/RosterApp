defmodule RosterApp.Repo.Migrations.CreateRosterApp.Organisations.Organisation do
  use Ecto.Migration

  def change do
    create table(:organisations_organisations) do
      add :name, :string

      timestamps()
    end

    create table(:organisations_organisations_users) do
      add :organisation_id, references(:organisations_organisations, on_delete: :nothing), null: false
      add :user_id, references(:accounts_users, on_delete: :nothing), null: false
      add :relationship, :string, null: false

      timestamps()
    end

    alter table(:rostering_rosters) do
      add :organisation_id, references(:organisations_organisations, on_delete: :nothing), null: false
    end
    
    # A user may only have at most 1 relationship with a given organisation
    unique_index(:organisations_organisations_users, [:organisation_id, :user_id], name: "organisations_organisations_users_unique_index")

  end
end
