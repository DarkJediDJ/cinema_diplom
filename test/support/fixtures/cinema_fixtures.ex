defmodule CinemaApi.CinemaFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CinemaApi.Cinema` context.
  """

  @doc """
  Generate a hall.
  """
  def hall_fixture(attrs \\ %{}) do
    {:ok, hall} =
      attrs
      |> Enum.into(%{
        places: 42,
        vip: true
      })
      |> CinemaApi.Cinema.create_hall()

    hall
  end

  @doc """
  Generate a movie.
  """
  def movie_fixture(attrs \\ %{}) do
    {:ok, movie} =
      attrs
      |> Enum.into(%{
        duration: "some duration",
        name: "some name",
        release_date: "some release_date"
      })
      |> CinemaApi.Cinema.create_movie()

    movie
  end

  @doc """
  Generate a session.
  """
  def session_fixture(attrs \\ %{}) do
    {:ok, session} =
      attrs
      |> Enum.into(%{
        end_at: "some end_at",
        start_at: "some start_at"
      })
      |> CinemaApi.Cinema.create_session()

    session
  end
end
