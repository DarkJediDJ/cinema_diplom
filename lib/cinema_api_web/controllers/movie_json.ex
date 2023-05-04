defmodule CinemaApiWeb.MovieJSON do
  alias CinemaApi.Cinema.Movie

  @doc """
  Renders a list of movies.
  """
  def index(%{movies: movies}) do
    %{data: for(movie <- movies, do: data(movie))}
  end

  @doc """
  Renders a single movie.
  """
  def show(%{movie: movie}) do
    %{data: data(movie)}
  end

  defp data(%Movie{} = movie) do
    %{
      id: movie.id,
      name: movie.name,
      duration: movie.duration,
      release_date: movie.release_date
    }
  end
end
