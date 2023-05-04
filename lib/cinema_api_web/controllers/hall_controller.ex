defmodule CinemaApiWeb.HallController do
  use CinemaApiWeb, :controller

  alias CinemaApi.Cinema
  alias CinemaApi.Cinema.Hall

  action_fallback CinemaApiWeb.FallbackController

  def index(conn, _params) do
    halls = Cinema.list_halls()
    render(conn, :index, halls: halls)
  end

  @spec create(any, any) :: any
  def create(conn, %{"hall" => hall_params}) do
    IO.inspect(hall_params)
    with {:ok, %Hall{} = hall} <- Cinema.create_hall(hall_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/halls/#{hall}")
      |> render(:show, hall: hall)
    end
  end

  @spec show(Plug.Conn.t(), map) :: Plug.Conn.t()
  def show(conn, %{"id" => id}) do
    hall = Cinema.get_hall!(id)
    render(conn, :show, hall: hall)
  end

  def update(conn, %{"id" => id, "hall" => hall_params}) do
    hall = Cinema.get_hall!(id)

    with {:ok, %Hall{} = hall} <- Cinema.update_hall(hall, hall_params) do
      render(conn, :show, hall: hall)
    end
  end

  def delete(conn, %{"id" => id}) do
    hall = Cinema.get_hall!(id)

    with {:ok, %Hall{}} <- Cinema.delete_hall(hall) do
      send_resp(conn, :no_content, "")
    end
  end
end
