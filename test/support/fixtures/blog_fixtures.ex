defmodule Turbo.BlogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Turbo.Blog` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        content: "some content",
        title: "some title"
      })
      |> Turbo.Blog.create_post()

    post
  end
end
