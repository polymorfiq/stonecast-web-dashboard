defmodule StonecastWeb.DevicesLive do
  use StonecastWeb, :live_view
  alias StonecastWeb.Components.Forms
  alias StonecastWeb.Components.Modal

  @impl true
  def mount(_params, _session, socket) do
    socket = socket
    |> assign(:devices, [%{name: "Testing"}])
    |> assign(:modal_state, :closed)

    {:ok, socket}
  end

  @impl true
  def handle_event("display_device_modal", _value, socket) do
    {:noreply, assign(socket, :modal_state, :add_device)}
  end

  @impl true
  def handle_info({:closed_modal, _}, socket) do
    IO.puts("BOOM")
    {:noreply, assign(socket, :modal_state, :closed)}
  end
end
