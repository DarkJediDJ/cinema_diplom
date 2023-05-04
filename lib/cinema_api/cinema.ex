defmodule CinemaApi.Cinema do
  @moduledoc """
  The Cinema context.
  """

  import Ecto.Query, warn: false
  alias CinemaApi.Repo

  alias CinemaApi.Cinema.Hall

  @doc """
  Returns the list of halls.

  ## Examples

      iex> list_halls()
      [%Hall{}, ...]

  """
  def list_halls do
    Repo.all(Hall)
  end

  @doc """
  Gets a single hall.

  Raises `Ecto.NoResultsError` if the Hall does not exist.

  ## Examples

      iex> get_hall!(123)
      %Hall{}

      iex> get_hall!(456)
      ** (Ecto.NoResultsError)

  """
  def get_hall!(id), do: Repo.get!(Hall, id)

  @doc """
  Creates a hall.

  ## Examples

      iex> create_hall(%{field: value})
      {:ok, %Hall{}}

      iex> create_hall(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_hall(attrs \\ %{}) do
    %Hall{}
    |> Hall.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a hall.

  ## Examples

      iex> update_hall(hall, %{field: new_value})
      {:ok, %Hall{}}

      iex> update_hall(hall, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_hall(%Hall{} = hall, attrs) do
    hall
    |> Hall.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a hall.

  ## Examples

      iex> delete_hall(hall)
      {:ok, %Hall{}}

      iex> delete_hall(hall)
      {:error, %Ecto.Changeset{}}

  """
  def delete_hall(%Hall{} = hall) do
    Repo.delete(hall)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking hall changes.

  ## Examples

      iex> change_hall(hall)
      %Ecto.Changeset{data: %Hall{}}

  """
  def change_hall(%Hall{} = hall, attrs \\ %{}) do
    Hall.changeset(hall, attrs)
  end

  alias CinemaApi.Cinema.Movie

  @doc """
  Returns the list of movies.

  ## Examples

      iex> list_movies()
      [%Movie{}, ...]

  """
  def list_movies do
    Repo.all(Movie)
  end

  @doc """
  Gets a single movie.

  Raises `Ecto.NoResultsError` if the Movie does not exist.

  ## Examples

      iex> get_movie!(123)
      %Movie{}

      iex> get_movie!(456)
      ** (Ecto.NoResultsError)

  """
  def get_movie!(id), do: Repo.get!(Movie, id)

  @doc """
  Creates a movie.

  ## Examples

      iex> create_movie(%{field: value})
      {:ok, %Movie{}}

      iex> create_movie(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_movie(attrs \\ %{}) do
    %Movie{}
    |> Movie.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a movie.

  ## Examples

      iex> update_movie(movie, %{field: new_value})
      {:ok, %Movie{}}

      iex> update_movie(movie, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_movie(%Movie{} = movie, attrs) do
    movie
    |> Movie.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a movie.

  ## Examples

      iex> delete_movie(movie)
      {:ok, %Movie{}}

      iex> delete_movie(movie)
      {:error, %Ecto.Changeset{}}

  """
  def delete_movie(%Movie{} = movie) do
    Repo.delete(movie)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking movie changes.

  ## Examples

      iex> change_movie(movie)
      %Ecto.Changeset{data: %Movie{}}

  """
  def change_movie(%Movie{} = movie, attrs \\ %{}) do
    Movie.changeset(movie, attrs)
  end

  alias CinemaApi.Cinema.Session

  @doc """
  Returns the list of sessions.

  ## Examples

      iex> list_sessions()
      [%Session{}, ...]

  """
  def list_sessions do
    Repo.all(Session)
  end

  @doc """
  Gets a single session.

  Raises `Ecto.NoResultsError` if the Session does not exist.

  ## Examples

      iex> get_session!(123)
      %Session{}

      iex> get_session!(456)
      ** (Ecto.NoResultsError)

  """
  def get_session!(id), do: Repo.get!(Session, id)

  @doc """
  Creates a session.

  ## Examples

      iex> create_session(%{field: value})
      {:ok, %Session{}}

      iex> create_session(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_session(attrs \\ %{}) do
    %Session{}
    |> Session.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a session.

  ## Examples

      iex> update_session(session, %{field: new_value})
      {:ok, %Session{}}

      iex> update_session(session, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_session(%Session{} = session, attrs) do
    session
    |> Session.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a session.

  ## Examples

      iex> delete_session(session)
      {:ok, %Session{}}

      iex> delete_session(session)
      {:error, %Ecto.Changeset{}}

  """
  def delete_session(%Session{} = session) do
    Repo.delete(session)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking session changes.

  ## Examples

      iex> change_session(session)
      %Ecto.Changeset{data: %Session{}}

  """
  def change_session(%Session{} = session, attrs \\ %{}) do
    Session.changeset(session, attrs)
  end
end
