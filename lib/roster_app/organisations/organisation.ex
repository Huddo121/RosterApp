defmodule RosterApp.Organisations.Organisation do
  use Ecto.Schema
  import Ecto.Changeset
  alias RosterApp.Organisations.Organisation


  schema "organisations" do
    field :name, :string
    many_to_many :users, RosterApp.Accounts.User, join_through: RosterApp.Organisations.OrganisationUser
    
    timestamps()
  end

  @doc false
  def changeset(%Organisation{} = organisation, attrs) do
    organisation
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
