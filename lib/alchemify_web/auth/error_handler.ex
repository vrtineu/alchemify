defmodule AlchemifyWeb.Auth.ErrorHandler do
  alias Plug.Conn
  @behaviour Guardian.Plug.ErrorHandler

  def auth_error(conn, {error, _reason}, _opts) do
    body = Jason.encode!(%{message: to_string(error)})
    Conn.send_resp(conn, :unauthorized, body)
  end
end
