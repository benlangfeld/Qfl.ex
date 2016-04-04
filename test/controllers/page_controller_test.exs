defmodule Queueflex.PageControllerTest do
  use Queueflex.ConnCase

  test "GET /" do
    conn = get conn(), "/"
    assert html_response(conn, 200) =~ "elm-container"
  end
end
