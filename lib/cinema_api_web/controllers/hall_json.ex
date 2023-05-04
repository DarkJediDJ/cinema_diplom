defmodule CinemaApiWeb.HallJSON do
  alias CinemaApi.Cinema.Hall

  @doc """
  Renders a list of halls.
  """
  def index(%{halls: halls}) do
    %{data: for(hall <- halls, do: data(hall))}
  end

  @doc """
  Renders a single hall.
  """
  def show(%{hall: hall}) do
    %{data: data(hall)}
  end

  defp data(%Hall{} = hall) do
    %{
      id: hall.id,
      places: hall.places,
      vip: hall.vip
    }
  end
end
