defmodule CinemaApi.Repo.Migrations.CreateMovies do
  use Ecto.Migration

  def change do
    create table(:movies) do
      add :name, :string
      add :duration, :string
      add :release_date, :string

      timestamps()
    end
  end
end
