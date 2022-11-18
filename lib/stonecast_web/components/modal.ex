defmodule StonecastWeb.Components.Modal do
  use Phoenix.LiveComponent

  @impl true
  def render(assigns) do
    ~H"""
    <div class="modal" phx-click="closed" phx-target={@myself}>
      <div class="content" onclick="event.stopPropagation();">
        <%= render_slot(@inner_block) %>
      </div>
    </div>
    """
  end

  @impl true
  def handle_event("closed", _value, socket) do
    send self(), {:closed_modal, %{id: socket.assigns.id}}
    {:noreply, socket}
  end
end
