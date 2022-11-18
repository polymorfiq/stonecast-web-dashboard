defmodule StonecastWeb.Components.Forms.Basic do
  use Phoenix.LiveComponent

  @impl true
  def render(assigns) do
    ~H"""
    <form phx-submitted="form_submitted" ph-target={@myself}>
      <%= render_slot(@inner_block) %>
    </form>
    """
  end
end
