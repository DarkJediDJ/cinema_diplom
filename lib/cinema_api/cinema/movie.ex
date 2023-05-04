defmodule CinemaApi.Cinema.Movie do
  use Ecto.Schema
  import Ecto.Changeset

  schema "movies" do
    field :duration, :string
    field :name, :string
    field :release_date, :string

    timestamps()
  end

  @doc false
  def changeset(movie, attrs) do
    movie
    |> cast(attrs, [:name, :duration, :release_date])
    |> validate_required([:name, :duration, :release_date])
  end
end
