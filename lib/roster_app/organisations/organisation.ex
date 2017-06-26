defmodule RosterApp.Organisations.Organisation do
  use Ecto.Schema
  import Ecto.Changeset
  alias RosterApp.Organisations.Organisation
  alias RosterApp.Organisations.OrganisationUser

  schema "organisations_organisations" do
    field :name, :string
    many_to_many :users, RosterApp.Accounts.User, join_through: OrganisationUser
    has_many :rosters, RosterApp.Rostering.Roster

    timestamps()
  end

  @doc false
  def changeset(%Organisation{} = organisation, attrs) do
    organisation
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
