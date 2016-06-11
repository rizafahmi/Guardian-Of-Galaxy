defmodule GuardianOfGalaxy.PageController do
  use GuardianOfGalaxy.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
  
  def secret(conn, _params) do
    render conn, "secret.html"
  end
end
