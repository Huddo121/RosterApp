defmodule RosterApp.Organisations.OrganisationUser do
  use Ecto.Schema
  import Ecto.Changeset
  alias RosterApp.Organisations.OrganisationUser
  alias RosterApp.Organisations.Organisation
  alias RosterApp.Accounts.User

  @default_user_relationship :member
  @admin_user_relationship :admin

  schema "organisations_users" do
    has_one :organisation, Organisation
    has_one :user, User
    field :relationship, :string, default: @default_user_relationship
  end

  @doc false
  def changeset(%OrganisationUser{} = organisation_user, attrs) do
    organisation_user
    |> cast(attrs, [:organisation, :user, :relationship])
    |> validate_required([:organisation, :user, :relationship])
    |> validate_inclusion(:relationship, [@default_user_relationship, @admin_user_relationship])
    |> unique_constraint(:organisation, name: "organisations_users_unique_index")
  end
end
  