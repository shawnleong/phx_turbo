defmodule TurboWeb.Live3 do
  use TurboWeb, :live_view

  alias TurboWeb.LinkComponent

  def mount(_params, _session, socket) do
    {:ok, assign(socket, count: 0)}
  end

  def handle_params(%{"count" => count}, _uri, socket) do
    {:noreply, assign(socket, count: String.to_integer(count))}
  end

  def handle_params(_params, _uri, socket) do
    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
    <h1>LiveView 3</h1>
    <label>This implements the counter via push_patch but exists in separate live session</label>

    <h2><%= @count %></h2>

    <button phx-click="inc">+</button>
    <button phx-click="dec">-</button>

    <LinkComponent.render socket={@socket} />
    """
  end

  def handle_event("inc", _params, socket) do
    {:noreply,
     push_patch(
       socket,
       to: Routes.live_path(socket, __MODULE__, count: socket.assigns.count + 1)
     )}
  end

  def handle_event("dec", _params, socket) do
    {:noreply,
     push_patch(
       socket,
       to: Routes.live_path(socket, __MODULE__, count: socket.assigns.count - 1)
     )}
  end
end
