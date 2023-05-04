defmodule CinemaApi.Repo.Migrations.CreateSessions do
  use Ecto.Migration

  def change do
    create table(:sessions) do
      add :start_at, :string
      add :end_at, :string
      add :hall_id, references(:halls, on_delete: :nothing)
      add :movie_id, references(:movies, on_delete: :nothing)

      timestamps()
    end

    create index(:sessions, [:hall_id])
    create index(:sessions, [:movie_id])
  end
end
