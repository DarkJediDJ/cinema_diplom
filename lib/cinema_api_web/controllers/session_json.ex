defmodule CinemaApiWeb.SessionJSON do
  alias CinemaApi.Cinema.Session

  @doc """
  Renders a list of sessions.
  """
  def index(%{sessions: sessions}) do
    %{data: for(session <- sessions, do: data(session))}
  end

  @doc """
  Renders a single session.
  """
  def show(%{session: session}) do
    %{data: data(session)}
  end

  defp data(%Session{} = session) do
    %{
      id: session.id,
      start_at: session.start_at,
      end_at: session.end_at
    }
  end
end
