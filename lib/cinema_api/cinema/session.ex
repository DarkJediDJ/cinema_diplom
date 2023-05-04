defmodule CinemaApi.Cinema.Session do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sessions" do
    field :end_at, :string
    field :start_at, :string
    field :hall_id, :id
    field :movie_id, :id

    timestamps()
  end

  @doc false
  def changeset(session, attrs) do
    session
    |> cast(attrs, [:start_at, :end_at])
    |> validate_required([:start_at, :end_at])
  end
end
