defmodule RosterApp.Rostering do
  @moduledoc """
  The Rostering context.
  """

  import Ecto.Query, warn: false
  alias RosterApp.Repo

  alias RosterApp.Rostering.Shift

  @doc """
  Returns the list of shifts.

  ## Examples

      iex> list_shifts()
      [%Shift{}, ...]

  """
  def list_shifts do
    Repo.all(Shift)
  end

  @doc """
  Gets a single shift.

  Raises `Ecto.NoResultsError` if the Shift does not exist.

  ## Examples

      iex> get_shift!(123)
      %Shift{}

      iex> get_shift!(456)
      ** (Ecto.NoResultsError)

  """
  def get_shift!(id), do: Repo.get!(Shift, id)

  @doc """
  Creates a shift.

  ## Examples

      iex> create_shift(%{field: value})
      {:ok, %Shift{}}

      iex> create_shift(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_shift(attrs \\ %{}) do
    %Shift{}
    |> Shift.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a shift.

  ## Examples

      iex> update_shift(shift, %{field: new_value})
      {:ok, %Shift{}}

      iex> update_shift(shift, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_shift(%Shift{} = shift, attrs) do
    shift
    |> Shift.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Shift.

  ## Examples

      iex> delete_shift(shift)
      {:ok, %Shift{}}

      iex> delete_shift(shift)
      {:error, %Ecto.Changeset{}}

  """
  def delete_shift(%Shift{} = shift) do
    Repo.delete(shift)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking shift changes.

  ## Examples

      iex> change_shift(shift)
      %Ecto.Changeset{source: %Shift{}}

  """
  def change_shift(%Shift{} = shift) do
    Shift.changeset(shift, %{})
  end

  alias RosterApp.Rostering.Roster

  @doc """
  Returns the list of rosters.

  ## Examples

      iex> list_rosters()
      [%Roster{}, ...]

  """
  def list_rosters do
    Repo.all(Roster)
  end

  @doc """
  Gets a single roster.

  Raises `Ecto.NoResultsError` if the Roster does not exist.

  ## Examples

      iex> get_roster!(123)
      %Roster{}

      iex> get_roster!(456)
      ** (Ecto.NoResultsError)

  """
  def get_roster!(id), do: Repo.get!(Roster, id)

  @doc """
  Creates a roster.

  ## Examples

      iex> create_roster(%{field: value})
      {:ok, %Roster{}}

      iex> create_roster(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_roster(attrs \\ %{}) do
    %Roster{}
    |> Roster.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a roster.

  ## Examples

      iex> update_roster(roster, %{field: new_value})
      {:ok, %Roster{}}

      iex> update_roster(roster, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_roster(%Roster{} = roster, attrs) do
    roster
    |> Roster.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Roster.

  ## Examples

      iex> delete_roster(roster)
      {:ok, %Roster{}}

      iex> delete_roster(roster)
      {:error, %Ecto.Changeset{}}

  """
  def delete_roster(%Roster{} = roster) do
    Repo.delete(roster)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking roster changes.

  ## Examples

      iex> change_roster(roster)
      %Ecto.Changeset{source: %Roster{}}

  """
  def change_roster(%Roster{} = roster) do
    Roster.changeset(roster, %{})
  end
end
