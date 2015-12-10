defmodule Queueflex.PageController do
  use Queueflex.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
