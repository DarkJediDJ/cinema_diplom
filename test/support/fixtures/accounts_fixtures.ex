defmodule CinemaApi.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CinemaApi.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        login: "some login",
        password: "some password"
      })
      |> CinemaApi.Accounts.create_user()

    user
  end
end
