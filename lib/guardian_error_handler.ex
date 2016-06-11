defmodule GuardianOfGalaxy.GuardianErrorHandler do
  import GuardianOfGalaxy.Router.Helpers

  def unauthenticated(conn, _params) do
    conn
    |> Phoenix.Controller.put_flash(:error, "You must be logged in!")
    |> Phoenix.Controller.redirect(to: page_path(conn, :index))
  end
end
