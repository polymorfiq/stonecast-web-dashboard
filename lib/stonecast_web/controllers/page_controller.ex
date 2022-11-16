defmodule StonecastWeb.PageController do
  use StonecastWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
