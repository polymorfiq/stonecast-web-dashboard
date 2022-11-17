defmodule StonecastWeb.Components.Modal do
  use Phoenix.LiveComponent

  def render(assigns) do
    ~H"""
    <div class="modal">
      <%= render_slot(@inner_block) %>
    </div>
    """
  end
end
