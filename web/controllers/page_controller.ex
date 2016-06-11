defmodule GuardianOfGalaxy.PageController do
  use GuardianOfGalaxy.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
