defmodule StonecastWeb.DevicesLive do
  use StonecastWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :devices, [%{name: "Testing"}])}
  end
end
