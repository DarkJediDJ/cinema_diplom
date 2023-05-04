defmodule CinemaApiWeb.HallControllerTest do
  use CinemaApiWeb.ConnCase

  import CinemaApi.CinemaFixtures

  alias CinemaApi.Cinema.Hall

  @create_attrs %{
    places: 42,
    vip: true
  }
  @update_attrs %{
    places: 43,
    vip: false
  }
  @invalid_attrs %{places: nil, vip: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all halls", %{conn: conn} do
      conn = get(conn, ~p"/api/halls")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create hall" do
    test "renders hall when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/halls", hall: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/halls/#{id}")

      assert %{
               "id" => ^id,
               "places" => 42,
               "vip" => true
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/halls", hall: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update hall" do
    setup [:create_hall]

    test "renders hall when data is valid", %{conn: conn, hall: %Hall{id: id} = hall} do
      conn = put(conn, ~p"/api/halls/#{hall}", hall: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/halls/#{id}")

      assert %{
               "id" => ^id,
               "places" => 43,
               "vip" => false
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, hall: hall} do
      conn = put(conn, ~p"/api/halls/#{hall}", hall: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete hall" do
    setup [:create_hall]

    test "deletes chosen hall", %{conn: conn, hall: hall} do
      conn = delete(conn, ~p"/api/halls/#{hall}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/halls/#{hall}")
      end
    end
  end

  defp create_hall(_) do
    hall = hall_fixture()
    %{hall: hall}
  end
end
