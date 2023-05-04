defmodule CinemaApi.CinemaTest do
  use CinemaApi.DataCase

  alias CinemaApi.Cinema

  describe "halls" do
    alias CinemaApi.Cinema.Hall

    import CinemaApi.CinemaFixtures

    @invalid_attrs %{places: nil, vip: nil}

    test "list_halls/0 returns all halls" do
      hall = hall_fixture()
      assert Cinema.list_halls() == [hall]
    end

    test "get_hall!/1 returns the hall with given id" do
      hall = hall_fixture()
      assert Cinema.get_hall!(hall.id) == hall
    end

    test "create_hall/1 with valid data creates a hall" do
      valid_attrs = %{places: 42, vip: true}

      assert {:ok, %Hall{} = hall} = Cinema.create_hall(valid_attrs)
      assert hall.places == 42
      assert hall.vip == true
    end

    test "create_hall/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Cinema.create_hall(@invalid_attrs)
    end

    test "update_hall/2 with valid data updates the hall" do
      hall = hall_fixture()
      update_attrs = %{places: 43, vip: false}

      assert {:ok, %Hall{} = hall} = Cinema.update_hall(hall, update_attrs)
      assert hall.places == 43
      assert hall.vip == false
    end

    test "update_hall/2 with invalid data returns error changeset" do
      hall = hall_fixture()
      assert {:error, %Ecto.Changeset{}} = Cinema.update_hall(hall, @invalid_attrs)
      assert hall == Cinema.get_hall!(hall.id)
    end

    test "delete_hall/1 deletes the hall" do
      hall = hall_fixture()
      assert {:ok, %Hall{}} = Cinema.delete_hall(hall)
      assert_raise Ecto.NoResultsError, fn -> Cinema.get_hall!(hall.id) end
    end

    test "change_hall/1 returns a hall changeset" do
      hall = hall_fixture()
      assert %Ecto.Changeset{} = Cinema.change_hall(hall)
    end
  end

  describe "movies" do
    alias CinemaApi.Cinema.Movie

    import CinemaApi.CinemaFixtures

    @invalid_attrs %{duration: nil, name: nil, release_date: nil}

    test "list_movies/0 returns all movies" do
      movie = movie_fixture()
      assert Cinema.list_movies() == [movie]
    end

    test "get_movie!/1 returns the movie with given id" do
      movie = movie_fixture()
      assert Cinema.get_movie!(movie.id) == movie
    end

    test "create_movie/1 with valid data creates a movie" do
      valid_attrs = %{duration: "some duration", name: "some name", release_date: "some release_date"}

      assert {:ok, %Movie{} = movie} = Cinema.create_movie(valid_attrs)
      assert movie.duration == "some duration"
      assert movie.name == "some name"
      assert movie.release_date == "some release_date"
    end

    test "create_movie/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Cinema.create_movie(@invalid_attrs)
    end

    test "update_movie/2 with valid data updates the movie" do
      movie = movie_fixture()
      update_attrs = %{duration: "some updated duration", name: "some updated name", release_date: "some updated release_date"}

      assert {:ok, %Movie{} = movie} = Cinema.update_movie(movie, update_attrs)
      assert movie.duration == "some updated duration"
      assert movie.name == "some updated name"
      assert movie.release_date == "some updated release_date"
    end

    test "update_movie/2 with invalid data returns error changeset" do
      movie = movie_fixture()
      assert {:error, %Ecto.Changeset{}} = Cinema.update_movie(movie, @invalid_attrs)
      assert movie == Cinema.get_movie!(movie.id)
    end

    test "delete_movie/1 deletes the movie" do
      movie = movie_fixture()
      assert {:ok, %Movie{}} = Cinema.delete_movie(movie)
      assert_raise Ecto.NoResultsError, fn -> Cinema.get_movie!(movie.id) end
    end

    test "change_movie/1 returns a movie changeset" do
      movie = movie_fixture()
      assert %Ecto.Changeset{} = Cinema.change_movie(movie)
    end
  end

  describe "sessions" do
    alias CinemaApi.Cinema.Session

    import CinemaApi.CinemaFixtures

    @invalid_attrs %{end_at: nil, start_at: nil}

    test "list_sessions/0 returns all sessions" do
      session = session_fixture()
      assert Cinema.list_sessions() == [session]
    end

    test "get_session!/1 returns the session with given id" do
      session = session_fixture()
      assert Cinema.get_session!(session.id) == session
    end

    test "create_session/1 with valid data creates a session" do
      valid_attrs = %{end_at: "some end_at", start_at: "some start_at"}

      assert {:ok, %Session{} = session} = Cinema.create_session(valid_attrs)
      assert session.end_at == "some end_at"
      assert session.start_at == "some start_at"
    end

    test "create_session/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Cinema.create_session(@invalid_attrs)
    end

    test "update_session/2 with valid data updates the session" do
      session = session_fixture()
      update_attrs = %{end_at: "some updated end_at", start_at: "some updated start_at"}

      assert {:ok, %Session{} = session} = Cinema.update_session(session, update_attrs)
      assert session.end_at == "some updated end_at"
      assert session.start_at == "some updated start_at"
    end

    test "update_session/2 with invalid data returns error changeset" do
      session = session_fixture()
      assert {:error, %Ecto.Changeset{}} = Cinema.update_session(session, @invalid_attrs)
      assert session == Cinema.get_session!(session.id)
    end

    test "delete_session/1 deletes the session" do
      session = session_fixture()
      assert {:ok, %Session{}} = Cinema.delete_session(session)
      assert_raise Ecto.NoResultsError, fn -> Cinema.get_session!(session.id) end
    end

    test "change_session/1 returns a session changeset" do
      session = session_fixture()
      assert %Ecto.Changeset{} = Cinema.change_session(session)
    end
  end
end
