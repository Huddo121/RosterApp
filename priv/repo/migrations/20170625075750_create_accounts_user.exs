defmodule RosterApp.Repo.Migrations.CreateRosterApp.Accounts.User do
  use Ecto.Migration

  def change do
    create table(:accounts_users) do
      add :email, :string
      add :display_name, :string
      add :password, :string

      timestamps()
    end

    create unique_index(:accounts_users, [:email])
  end
end
