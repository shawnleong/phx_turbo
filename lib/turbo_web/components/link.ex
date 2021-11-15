defmodule TurboWeb.LinkComponent do
  use TurboWeb, :component

  def render(assigns) do
    ~H"""
    <div>
      <%= for module <- [TurboWeb.Live1, TurboWeb.Live2, TurboWeb.Live3] do %>
        <%= link "#{module} (link)", to: Routes.live_url(@socket, module) %>
        <%= live_redirect "#{module} (live_redirect)", to: Routes.live_path(@socket, module) %>
        <%= live_patch "#{module} (live_patch)", to: Routes.live_path(@socket, module) %>
        <hr/>
      <% end %>
    </div>
    """
  end
end
