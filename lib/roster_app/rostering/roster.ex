defmodule RosterApp.Rostering.Roster do
  use Ecto.Schema
  import Ecto.Changeset
  alias RosterApp.Rostering.Roster


  schema "rostering_rosters" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Roster{} = roster, attrs) do
    roster
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
