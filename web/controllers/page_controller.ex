defmodule Queueflex.PageController do
  @moduledoc false

  use Queueflex.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
