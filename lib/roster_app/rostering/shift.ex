defmodule RosterApp.Rostering.Shift do
  use Ecto.Schema
  import Ecto.Changeset
  alias RosterApp.Rostering.Shift


  schema "rostering_shifts" do
    field :end_time, :naive_datetime
    field :start_time, :naive_datetime
    field :user_id, :id

    timestamps()
  end

  @doc false
def changeset(%Shift{} = shift, attrs) do
    shift
    |> cast(attrs, [:start_time, :end_time, :user_id])
    |> validate_required([:start_time, :end_time, :user_id])
  end
end
