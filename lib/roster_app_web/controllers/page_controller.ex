defmodule RosterAppWeb.PageController do
  use RosterAppWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
