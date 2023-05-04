defmodule CinemaApi.Cinema.Hall do
  use Ecto.Schema
  import Ecto.Changeset

  schema "halls" do
    field :places, :integer
    field :vip, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(hall, attrs) do
    hall
    |> cast(attrs, [:places, :vip])
    |> validate_required([:places, :vip])
  end
end
