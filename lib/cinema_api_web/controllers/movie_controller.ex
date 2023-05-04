defmodule CinemaApiWeb.MovieController do
  use CinemaApiWeb, :controller

  alias CinemaApi.Cinema
  alias CinemaApi.Cinema.Movie

  action_fallback CinemaApiWeb.FallbackController

  def index(conn, _params) do
    movies = Cinema.list_movies()
    render(conn, :index, movies: movies)
  end

  def create(conn, %{"movie" => movie_params}) do
    with {:ok, %Movie{} = movie} <- Cinema.create_movie(movie_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/movies/#{movie}")
      |> render(:show, movie: movie)
    end
  end

  def show(conn, %{"id" => id}) do
    movie = Cinema.get_movie!(id)
    render(conn, :show, movie: movie)
  end

  def update(conn, %{"id" => id, "movie" => movie_params}) do
    movie = Cinema.get_movie!(id)

    with {:ok, %Movie{} = movie} <- Cinema.update_movie(movie, movie_params) do
      render(conn, :show, movie: movie)
    end
  end

  def delete(conn, %{"id" => id}) do
    movie = Cinema.get_movie!(id)

    with {:ok, %Movie{}} <- Cinema.delete_movie(movie) do
      send_resp(conn, :no_content, "")
    end
  end
end
