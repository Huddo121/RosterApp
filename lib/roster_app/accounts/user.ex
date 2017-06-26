defmodule RosterApp.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias RosterApp.Accounts.User
  alias RosterApp.Organisations.OrganisationUser
  alias RosterApp.Organisations.Organisation


  schema "accounts_users" do
    field :display_name, :string
    field :email, :string
    field :password, :string
    has_many :shifts, RosterApp.Rostering.Shift
    many_to_many :organisations, Organisation, join_through: OrganisationUser

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email, :display_name, :password])
    |> validate_required([:email, :display_name, :password])
    |> validate_format(:email, ~r/.+@.+\..+/, [message: "Please input an email"])
    |> unique_constraint(:email)
  end
end
