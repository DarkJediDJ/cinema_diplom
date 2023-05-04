defmodule CinemaApi.Repo.Migrations.CreateHalls do
  use Ecto.Migration

  def change do
    create table(:halls) do
      add :places, :integer
      add :vip, :boolean, default: false, null: false

      timestamps()
    end
  end
end
