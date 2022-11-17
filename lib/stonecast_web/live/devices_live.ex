defmodule StonecastWeb.DevicesLive do
  use StonecastWeb, :live_view
  alias StonecastWeb.Components.Modal


  def mount(_params, _session, socket) do
    socket = socket
    |> assign(:devices, [%{name: "Testing"}])
    |> assign(:modal_state, :closed)

    {:ok, socket}
  end

  def handle_event("display_device_modal", _value, socket) do
    {:noreply, assign(socket, :modal_state, :add_device)}
  end
end
